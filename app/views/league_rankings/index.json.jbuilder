json.array!(@league_rankings) do |league_ranking|
  json.extract! league_ranking, :id
  json.url league_ranking_url(league_ranking, format: :json)
end
