json.array!(@current_matches) do |current_match|
  json.extract! current_match, :id
  json.url current_match_url(current_match, format: :json)
end
