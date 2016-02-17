#coding: utf-8
#设备资料
class EquipmentController < BaseController
  table :name,:equipment_category,:unit,:purchase_date,:factory_name,:model

  private
  def equipment_params
    params.require(:equipment).permit()
  end
end

