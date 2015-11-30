json.array!(@companies) do |company|
  json.extract! company, :id, :cn_name, :en_name
  json.url company_url(company, format: :json)
end
