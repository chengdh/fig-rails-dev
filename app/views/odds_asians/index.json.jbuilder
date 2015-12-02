json.array!(@odds_asians) do |odds_asian|
  json.extract! odds_asian, :id
  json.url odds_asian_url(odds_asian, format: :json)
end
