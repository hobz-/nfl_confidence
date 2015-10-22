class AddSeasonToWeek < ActiveRecord::Migration
  def change
    add_column :weeks, :season, :integer
  end
end
