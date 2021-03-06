json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :country, :region
  json.url venue_url(venue, format: :json)
end
