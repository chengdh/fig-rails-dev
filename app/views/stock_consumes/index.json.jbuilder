json.stock_list collection do |st|
  json.equipment_name st.equipment.name
  json.equipment_id st.equipment_id
  json.equipment_category_name st.try(:equipment).try(:equipment_category).try(:name)
  json.unit_name st.try(:equipment).try(:unit).try(:name)
  json.factory_name st.try(:equipment).try(:factory_name)
  json.location st.location
  json.qty st.qty
  json.brand st.brand
  json.model st.model
end
