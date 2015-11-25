json.array!(@contients) do |contient|
  json.extract! contient, :id, :continents_id, :cn_name, :en_name, :sort_value
  json.url contient_url(contient, format: :json)
end
