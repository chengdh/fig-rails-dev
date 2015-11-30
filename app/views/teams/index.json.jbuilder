json.array!(@teams) do |team|
  json.extract! team, :id, :cn_name, :tr_name, :en_name
  json.url team_url(team, format: :json)
end
