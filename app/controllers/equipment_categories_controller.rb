#coding: utf-8
#设备类别
class EquipmentCategoriesController < BaseController
  table :name,:org,:order_by,:is_active
  private
  def equipment_category_params
    params.require(:equipment_category).permit(:name, :order_by, :is_active, :org_id)
  end
end
