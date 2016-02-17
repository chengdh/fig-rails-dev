#coding: utf-8
module EquipmentCategoriesHelper
  def equipment_categories_for_select
    EquipmentCategory.where(is_active: true).map {|ec| [ec.name,ec.id]}
  end
end
