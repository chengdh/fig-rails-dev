#coding: utf-8
#添加员工管理功能
class AddEmployeeFunction < ActiveRecord::Migration
  def change
    group_name = "人力资源管理"
    sf_name = "员工信息"
    subject = "Employee"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'employees_path',
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
