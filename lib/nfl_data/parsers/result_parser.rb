module NflData
  class ResultParser
    attr_reader :base_url
    
    def initialize
      @base_url = "http://www.nfl.com/scores/"
    end
    
    def get_result(year, week)
      get(year, week)
    end
    
    private
          
      def get(year, week)
        url = @base_url + "#{year}/REG#{week}"
        
        doc = open(url) { |f| Nokogiri(f) }
        
        score_boxes = doc.search('div.new-score-box-wrapper')
        weekly_results = Week.new
        weekly_results.week = week
        home_team_css = 'div.new-score-box div.team-wrapper div.home-team'
        away_team_css = 'div.new-score-box div.team-wrapper div.away-team'
        score_boxes.each do |box|
            game_result = Week::Result.new
            game_result.game_day = box.css('div.new-score-box-heading p span.date').text
            game_result.game_time = box.css('div.new-score-box div.game-center-area p span.time-left').text
            
            game_result.home_team = box.css(home_team_css + ' div.team-data div.team-info p.team-name').text
            game_result.home_city = box.css(home_team_css + ' a')[0]['href'][20..-1]
            game_result.home_record = box.css(home_team_css + ' div.team-data div.team-info p.team-record').text.squish
            game_result.home_score = box.css(home_team_css + ' div.team-data p.total-score').text
            game_result.home_img = box.css(home_team_css + ' img')[0]['src']
            
            game_result.away_team = box.css(away_team_css + ' div.team-data div.team-info p.team-name').text
            game_result.away_city = box.css(away_team_css + ' a')[0]['href'][20..-1]
            game_result.away_record = box.css(away_team_css + ' div.team-data div.team-info p.team-record').text.squish
            game_result.away_score = box.css(away_team_css + ' div.team-data p.total-score').text
            game_result.away_img = box.css(away_team_css + ' img')[0]['src']
            
            if game_result.home_score > game_result.away_score
              game_result.winner = game_result.home_city
            elsif game_result.away_score > game_result.home_score
              game_result.winner = game_result.away_city
            else
              game_result.winner = "TBD"
            end
            weekly_results.games << game_result
        end
        
        weekly_results
      end
      
  end
end