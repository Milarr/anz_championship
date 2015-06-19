json.array!(@teams) do |team|
  json.extract! team, :id, :name, :country, :region
  json.url team_url(team, format: :json)
end
