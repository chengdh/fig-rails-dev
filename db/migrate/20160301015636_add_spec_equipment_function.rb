#coding: utf-8
#特种设备管理
class AddSpecEquipmentFunction < ActiveRecord::Migration
  def change
    group_name = "安保-基础信息设置"
    sf_name = "特种设备管理"
    subject = "SpecEquipment"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'spec_equipments_path',
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
