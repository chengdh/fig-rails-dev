json.odd_changes @odd_changes do |o|
  json.team o.try(:team)
  json.match o.try(:match)
  json.change_type o.try(:read_attribute_before_type_cast,:change_type)
  json.match_type o.try(:read_attribute_before_type_cast,:match_type)
  json.change_type_des change_type_des(o.try(:read_attribute_before_type_cast,:change_type))
  json.match_type_des match_type_des(o.try(:read_attribute_before_type_cast,:match_type))
  json.home1 o.try(:home1)
  json.goal1 o.try(:goal1)
  json.away1 o.try(:away1)
  json.home2 o.try(:home2)
  json.goal2 o.try(:goal2)
  json.away2 o.try(:away2)
  json.timestamp o.try(:data_time).to_time.to_i
end

