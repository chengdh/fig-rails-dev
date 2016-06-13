#coding: utf-8
class AddColumnsToSalaryReportLeaderLine < ActiveRecord::Migration
  def change
    add_column :salary_report_leader_lines, :grant_rate, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_report_leader_lines, :basic_salary, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_report_leader_lines, :pref_salary, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_report_leader_lines, :mth_pref_base, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_report_leader_lines, :year_pref_base, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_report_leader_lines, :pref_rate, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_report_leader_lines, :post_salary, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_report_leader_lines, :living_base, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_report_leader_lines, :living_salary_rate, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_report_leader_lines, :living_salary, :decimal,precision: 15,scale: 2,default: 0
  end
end
