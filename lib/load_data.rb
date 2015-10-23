require 'nokogiri'
require 'open-uri'
require 'json'

load 'nfl_data/models/result.rb'
load 'nfl_data/parsers/result_parser.rb'

def load_week(season, week_number)
  @weekly_results = NflData::ResultParser.new
  @games = @weekly_results.get_result(season,week_number)
  @week = Week.find_by(number:week_number)
  @games.games.each do |result|
    @game = @week.games.new
    @game.season = season
    @game.game_day = result.game_day
    @game.game_time = result.game_time
            
    @game.home_team = result.home_team
    @game.home_city = result.home_city
    @game.home_record = result.home_record
    @game.home_img = result.home_img
    @game.away_team = result.away_team
    @game.away_city = result.away_city
    @game.away_record = result.away_record
    @game.away_img = result.away_img
    @game.home_score = result.home_score
    @game.away_score = result.away_score
    
    if @game.home_score > @game.away_score
      @game.winner = "home_team"
    elsif
      @game.away_score > @game.home_score
      @game.winner = "away_team"
    else
      @game.winner = "TBD"
    end
    @game.game_start = @game.convert_game_time
    @game.save
  end
end