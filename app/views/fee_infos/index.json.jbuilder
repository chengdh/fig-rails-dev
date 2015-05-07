json.array!(@fee_infos) do |fee_info|
  json.extract! fee_info, :id, :user_id, :fee_date, :cr, :dr, :note
  json.url fee_info_url(fee_info, format: :json)
end
