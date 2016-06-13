#coding: utf-8
class ChangeSalaryReportLeaderLineTableName < ActiveRecord::Migration
  def change
    rename_table("salary_report_leaders","base_salary_reports")
    rename_table("salary_report_leader_lines","salary_report_lines")
    rename_column(:salary_report_lines,:salary_report_leader_id,:base_salary_report_id)
  end
end
