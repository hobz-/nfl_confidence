class Game < ActiveRecord::Base
  belongs_to :week
  has_many :picks, :dependent => :destroy
  
  def convert_game_time
    index = self.game_time.index("AM") || self.game_time.index("PM")
    if index != nil
      game_time = self.game_time[0..(index+1)]
    elsif self.game_time.index("FINAL") != nil
      game_time = "12:00 AM"
    end
    date_and_time = '%a, %b %e %Y %l:%M %p %Z'
    if self.week.number == 17
      DateTime.strptime(self.game_day + " 2017 " + game_time + "Eastern Time (US & Canada)",date_and_time)
    else
      DateTime.strptime(self.game_day + " 2016 " + game_time + "Eastern Time (US & Canada)",date_and_time)
    end
  end
  
  def has_started?
    self.game_time.index("FINAL") == 0 || self.game_start <= Time.now
  end
end
