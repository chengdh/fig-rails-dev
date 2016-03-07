#coding: utf-8
#设备资料
class EquipmentController < BaseController
  table :name,:equipment_category,:unit,:purchase_date,:factory_name,:model

  #GET equipment_index/select
  #GET equipment_index/select.json
  def select
    render partial: "select"
  end

  private
  def equipment_params
    params.require(:equipment).permit()
  end
end

