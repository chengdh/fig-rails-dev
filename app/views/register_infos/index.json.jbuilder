json.array!(@register_infos) do |register_info|
  json.extract! register_info, :id, :company_name
  json.url register_info_url(register_info, format: :json)
end
