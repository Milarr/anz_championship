class CreateGameMatchesAndTeams < ActiveRecord::Migration
  def change
    create_table :game_matches_and_teams, id: false do |t|
      t.belongs_to :game_match, index: true
      t.belongs_to :team,       index: true
    end
  end
end
