json.array!(@odds_europes) do |odds_europe|
  json.extract! odds_europe, :id
  json.url odds_europe_url(odds_europe, format: :json)
end
