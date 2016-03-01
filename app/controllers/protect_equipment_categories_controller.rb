#coding: utf-8
class ProtectEquipmentCategoriesController < BaseController

  private

  def protect_equipment_category_params
    params.require(:protect_equipment_category).permit(:name, :order_by, :is_active)
  end
end

