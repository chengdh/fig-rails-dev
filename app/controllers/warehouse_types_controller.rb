#coding: utf-8
class WarehouseTypesController < BaseController
  table :name,:order_by,:is_active
  private

  def warehouse_type_params
    params.require(:warehouse_type).permit(:name, :order_by, :is_active)
  end
end

