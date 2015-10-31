json.array!(@web_apps) do |web_app|
  json.extract! web_app, :id, :name, :el_username, :el_password, :is_active
  json.url web_app_url(web_app, format: :json)
end
