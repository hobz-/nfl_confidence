class AddGameStartToGame < ActiveRecord::Migration
  def change
    add_column :games, :game_start, :datetime
  end
end
