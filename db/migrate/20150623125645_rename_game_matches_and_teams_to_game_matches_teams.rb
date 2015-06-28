class RenameGameMatchesAndTeamsToGameMatchesTeams < ActiveRecord::Migration
  def change
    rename_table :game_matches_and_teams, :game_matches_teams
  end
end
