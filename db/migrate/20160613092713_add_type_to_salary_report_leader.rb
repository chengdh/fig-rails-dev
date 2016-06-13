#coding: utf-8
class AddTypeToSalaryReportLeader < ActiveRecord::Migration
  def change
    add_column :salary_report_leaders,:type,:string,limit: 60
  end
end
