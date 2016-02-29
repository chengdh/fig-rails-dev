#coding: utf-8
#添加消防设施管理功能
class AddFireFightingEquipmentFunction < ActiveRecord::Migration
  def change
    group_name = "安保-基础信息设置"
    sf_name = "消防设施管理"
    subject = "FireFightingEquipment"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'fire_fighting_equipments_path',
      function: {
        create: {name: "新建"},
        update: {name: "修改"},
        destroy: {name:"删除"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
