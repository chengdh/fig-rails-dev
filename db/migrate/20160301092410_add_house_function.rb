#coding: utf-8
class AddHouseFunction < ActiveRecord::Migration
  def change
    group_name = "安保-基础信息设置"
    sf_name = "房舍及院落管理"
    subject = "House"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'houses_path',
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
