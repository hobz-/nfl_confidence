module NflData
  class Week
    attr_accessor :week, :games
    
    def initialize
      @games = []
    end
    
    def to_hash
      
      {
        week: week,
        games: @games.map {|game| game.to_hash }
      }
    end
    
    class Result
      attr_accessor :game_day, :game_time, :winner,
                    :home_team, :home_city, :home_record, :home_score, :home_img,
                    :away_team, :away_city, :away_record, :away_score, :away_img
      
      def to_hash
        {
          game_day: game_day,
          game_time: game_time,
          winner: winner,
          home_team: home_team,
          home_city: home_city,
          home_record: home_record,
          home_score: home_score,
          home_img: home_img,
          away_team: away_team,
          away_city: away_city,
          away_record: away_record,
          away_score: away_score,
          away_img: away_img
        }
      end
    end
  end
end