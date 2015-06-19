class CreateGameMatches < ActiveRecord::Migration
  def change
    create_table :game_matches do |t|
      t.integer :year
      t.integer :round
      t.datetime :date
      t.string :home_team
      t.string :away_team
      t.integer :home_score
      t.integer :away_score
      t.string :venue

      t.timestamps null: false
    end
  end
end
