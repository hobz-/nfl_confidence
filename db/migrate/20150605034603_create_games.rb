class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :away_team
      t.string :home_team
      t.integer :away_score
      t.integer :home_score
      t.string :winner
      t.references :week

      t.timestamps null: false
    end
  end
end
