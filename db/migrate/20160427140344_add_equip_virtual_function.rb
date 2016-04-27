#coding: utf-8
class AddEquipVirtualFunction < ActiveRecord::Migration
  def change
    group_name = "信息-无形资产管理"
    sf_name = "无形资产资料"
    subject = "EquipVirtual"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'equip_virtuals_path',
      function: {
        read: {name: "查看"},
        create: {name: "新建"},
        update: {name: "修改"},
        destroy: {name:"删除"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
