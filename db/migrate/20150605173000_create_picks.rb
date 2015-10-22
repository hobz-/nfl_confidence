class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references :game, index: true
      t.integer :away_team
      t.integer :home_team

      t.timestamps null: false
    end
    add_foreign_key :picks, :games
  end
end
