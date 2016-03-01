#coding: utf-8
#司机信息管理
class AddDriverFunction < ActiveRecord::Migration
  def change
    group_name = "安保-基础信息设置"
    sf_name = "驾驶员信息管理"
    subject = "Driver"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'drivers_path',
      function: {
        create: {name: "新建"},
        update: {name: "修改"},
        destroy: {name:"删除"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)

  end
end
