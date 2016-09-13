#coding: utf-8
#添加县局劳务工资表功能
class AddSalaryTableXianNonStaffFunction < ActiveRecord::Migration
  def change
    group_name = "人力资源管理"
    sf_name = "工资表-县局劳务"
    subject = "SalaryTableXianNonStaff"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'salary_table_xian_non_staffs_path',
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