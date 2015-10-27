require 'nokogiri'
require 'open-uri'
require 'json'

load 'lib/nfl_data/models/result.rb'
load 'lib/nfl_data/parsers/result_parser.rb'
 
season, week_number = ARGV 
    
@weekly_results = NflData::ResultParser.new
@games = @weekly_results.get_result(season,week_number)
@week = Week.find_by(number:week_number)
@games.games.each do |result|
    @game = @week.games.find_by(home_team:result.home_team)

    @game.game_time = result.game_time
    
    if @game.game_time.index("FINAL") == 0
        
        @game.home_score = result.home_score
        @game.away_score = result.away_score
        
        if @game.home_score > @game.away_score
          @game.winner = "home_team"
        elsif @game.away_score > @game.home_score
          @game.winner = "away_team"
        end
    elsif @game.game_time.index("posdisp") != nil
        @game.game_time = "IN PROGRESS"
    end

    @game.save
    
end

Pick.where(week_id: week_number).find_each do |pick|
    if pick
        winner = pick.game.winner #pick.game.winner returns home_team/away_team. pick[winner] will return the wager (either 0 if wrong or >0pts if right)
        if winner != "TBD"
            if pick.result == nil
                if pick.user.score.nil?
                    pick.user.score = 0
                end
                pick.user.score += pick[winner]
                pick.user.save
                pick.result = pick[winner] 
                pick.save
            end
        end
    end
end