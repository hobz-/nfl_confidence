class Game < ActiveRecord::Base
  belongs_to :week
  has_many :picks
  
  def convert_game_time
    index = self.game_time.index("AM") || self.game_time.index("PM")
    if index != nil
      game_time = self.game_time[0..(index+1)]
    elsif self.game_time.index("FINAL") != nil
      game_time = "1:00 PM"
    end
    date_and_time = '%a, %b %e %Y %l:%M %p %Z'
    DateTime.strptime(self.game_day + " 2015 " + game_time + "Eastern Time (US & Canada)",date_and_time)
  end
end
