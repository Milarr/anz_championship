json.array!(@game_matches) do |game_match|
  json.extract! game_match, :id, :year, :round, :date, :home_team, :away_team, :home_score, :away_score, :venue
  json.url game_match_url(game_match, format: :json)
end
