#coding: utf-8
class AddLocationFunction < ActiveRecord::Migration
  def change
    group_name = "设备管理"
    sf_name = "库位设置"
    subject = "Location"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'locations_path',
      function: {
        create: {name: "新建"},
        update: {name: "修改"},
        destroy: {name:"删除"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end