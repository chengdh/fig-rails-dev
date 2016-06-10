#coding: utf-8
#添加市局劳务-工资表功能
class AddSalaryTableShiNonStarffFunction < ActiveRecord::Migration
  def change
    group_name = "人力资源管理"
    sf_name = "工资表-市局编外加内退"
    subject = "SalaryTableShiNonStaff"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'salary_table_shi_non_staffs_path',
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
