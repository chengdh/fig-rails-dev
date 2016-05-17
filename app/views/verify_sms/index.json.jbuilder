json.array!(@verify_sms) do |verify_sm|
  json.extract! verify_sm, :id, :mobile, :verify_code, :verity_type, :is_used
  json.url verify_sm_url(verify_sm, format: :json)
end
