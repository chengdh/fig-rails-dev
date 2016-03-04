#coding: utf-8
#机构管理功能
class AddOrgFunction < ActiveRecord::Migration
  def change
    group_name = "系统设置"
    sf_name = "机构管理"
    subject = "Org"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'orgs_path',
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
