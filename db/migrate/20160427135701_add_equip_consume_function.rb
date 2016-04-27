#coding: utf-8
class AddEquipConsumeFunction < ActiveRecord::Migration
  def change
    group_name = "信息-易耗品管理"
    sf_name = "易耗品资料"
    subject = "EquipConsume"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'equip_consumes_path',
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
