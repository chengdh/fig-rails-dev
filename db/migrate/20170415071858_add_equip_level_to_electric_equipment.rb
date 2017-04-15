#coding: utf-8
class AddEquipLevelToElectricEquipment < ActiveRecord::Migration
  def change
    add_column :electric_equipments, :equip_level, :integer
  end
end
