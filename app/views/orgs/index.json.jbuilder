json.array!(@orgs) do |org|
  json.extract! org, :id, :name, :, :address, :org_type, :is_active, :order_by, :note
  json.url org_url(org, format: :json)
end
