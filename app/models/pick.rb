class Pick < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  belongs_to :week
  
  validates_presence_of :game_id, :user_id, :home_team, :away_team
  
  validate :home_xor_away
  validate :pick_within_range
  
  def updated_and_changed?(pick)
    if !(pick[:home_team].to_i == self.home_team && pick[:away_team].to_i == self.away_team)
      self.update(pick)
    else
      return false
    end
  end
  
  private
  
    def home_xor_away
      if !(home_team == 0 && away_team == 0)
        if !(home_team.zero? ^ away_team.zero?)
          game = Game.find(game_id)
          errors.add(:base, "Error in #{game.away_team} vs. #{game.home_team}, select home or away team.")
        end
      end
    end

    def pick_within_range
      @week = Week.find(self.week_id)
      max = @week.games.count
      @game = Game.find(self.game_id)
      if self.home_team > max || self.away_team > max
        errors.add(:base, "Error in #{@game.away_team} vs. #{@game.home_team}, maximum pick is #{max}")
      elsif self.home_team < 0 || self.away_team < 0
        errors.add(:base, "Error in #{@game.away_team} vs. #{@game.home_team}, negative number used for pick.")
      end
    end
    
end
