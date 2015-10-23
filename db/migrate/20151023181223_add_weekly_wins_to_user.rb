class AddWeeklyWinsToUser < ActiveRecord::Migration
  def change
    add_column :users, :weekly_wins, :integer
  end
end
