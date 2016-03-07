i = 1
json.equipment_list collection do |eq|
  json.idx i
  json.name eq.name
  json.equipment_category_name eq.try(:equipment_category).try(:name)
  json.unit_name eq.try(:unit).try(:name)
  json.factory_name eq.try(:factory_name)
  json.model eq.try(:model)
  i + 1
end
