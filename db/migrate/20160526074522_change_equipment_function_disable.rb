#coding: utf-8
class ChangeEquipmentFunctionDisable < ActiveRecord::Migration
  def change
    sfg = SystemFunctionGroup.find_by(name: '设备管理')
    sfg.update_attributes(is_active: false) if sfg.present?
  end
end
