#coding: utf-8
module ProtectEquipmentCategoriesHelper
  def protect_equipment_categories_for_select
    ProtectEquipmentCategory.where(is_active: true).order("order_by ASC").map {|c| [c.name,c.id]}
  end
end
