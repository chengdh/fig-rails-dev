json.array!(@user_favorites) do |user_favorite|
  json.extract! user_favorite, :id
  json.url user_favorite_url(user_favorite, format: :json)
end
