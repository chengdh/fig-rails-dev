json.array!(@lineups) do |lineup|
  json.extract! lineup, :id
  json.url lineup_url(lineup, format: :json)
end
