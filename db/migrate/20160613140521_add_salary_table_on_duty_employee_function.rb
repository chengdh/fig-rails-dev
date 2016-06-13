#coding: utf-8
class AddSalaryTableOnDutyEmployeeFunction < ActiveRecord::Migration
  def change
    group_name = "人力资源管理"
    sf_name = "在岗员工收入台账(在册+三产)"
    subject = "SalaryReportOnDutyEmployee"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'salary_report_on_duty_employees_path',
      function: {
        read: {name: "查看"},
        # create: {name: "新建"},
        update: {name: "修改"},
        destroy: {name:"删除"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
