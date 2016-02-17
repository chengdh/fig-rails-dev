#coding: utf-8
class AddEquipmentFunction < ActiveRecord::Migration
  def change
    group_name = "设备管理"
    sf_name = "设备资料"
    subject = "Equipment"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'equipment_path',
      function: {
        create: {name: "新建"},
        update: {name: "修改"},
        destroy: {name:"删除"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
