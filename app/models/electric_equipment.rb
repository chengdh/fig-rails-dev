#coding: utf-8
#电气设备
class ElectricEquipment < ActiveRecord::Base

  HIGH_PRESSURE_ROOM = "high_pressure_room"
  LOW_PRESSURE_ROOM = "low_pressure_room"
  TRANSFORMER = "transformer"
  DISTRIBUTE_BOX = "distribute_box"

  def self.types
    {
      HIGH_PRESSURE_ROOM => "高压配电室",
      LOW_PRESSURE_ROOM => "低压配电室",
      TRANSFORMER => "变压器",
      DISTRIBUTE_BOX => "配电柜"

    }
  end

  def electric_equipment_type_des
    ElectricEquipment.types[electric_equipment_type]
  end

  def fire_level_des
    ret = ""
    ret = "1级" if fire_level == 1
    ret = "2级" if fire_level == 2
    ret = "3级" if fire_level == 3
    ret = "4级" if fire_level == 4
    ret
  end


  belongs_to :org
  belongs_to :manage_org,class_name: "Org"
  validates :org_id,presence: true
end
