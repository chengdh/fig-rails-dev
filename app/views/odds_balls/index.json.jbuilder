json.array!(@odds_balls) do |odds_ball|
  json.extract! odds_ball, :id
  json.url odds_ball_url(odds_ball, format: :json)
end
