#coding: utf-8
#添加计量单位功能
class AddUnitFunciton < ActiveRecord::Migration
  def change
    group_name = "设备管理"
    sf_name = "计量单位"
    subject = "Unit"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'units_path',
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
