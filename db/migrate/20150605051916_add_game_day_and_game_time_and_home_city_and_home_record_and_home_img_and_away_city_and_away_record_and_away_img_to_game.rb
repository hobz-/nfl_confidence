class AddGameDayAndGameTimeAndHomeCityAndHomeRecordAndHomeImgAndAwayCityAndAwayRecordAndAwayImgToGame < ActiveRecord::Migration
  def change
    add_column :games, :game_day, :string
    add_column :games, :game_time, :string
    add_column :games, :home_city, :string
    add_column :games, :home_img, :string
    add_column :games, :away_city, :string
    add_column :games, :away_img, :string
    add_column :games, :home_record, :string
    add_column :games, :away_record, :string
  end
end
