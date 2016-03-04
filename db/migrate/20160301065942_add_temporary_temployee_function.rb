#coding: utf-8
class AddTemporaryTemployeeFunction < ActiveRecord::Migration
  def change
    group_name = "安保-基础信息设置"
    sf_name = "相关方人员管理"
    subject = "TemporaryEmployee"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'temporary_employees_path',
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
