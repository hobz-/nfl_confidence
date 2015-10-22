class RemoveGameUtcFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :game_utc, :datetime
  end
end
