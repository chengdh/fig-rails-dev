#coding: utf-8
class AddSalaryColsToSalaryReportLeaderLine < ActiveRecord::Migration
  def change
    (1..13).each do |i|
      add_column :salary_report_leader_lines,"mth_#{i}st_basic_salary",:decimal,precision: 15,scale: 2,default: 0
      add_column :salary_report_leader_lines,"mth_#{i}st_pref_salary",:decimal,precision: 15,scale: 2,default: 0
      add_column :salary_report_leader_lines,"mth_#{i}st_post_salary",:decimal,precision: 15,scale: 2,default: 0
      add_column :salary_report_leader_lines,"mth_#{i}st_living_salary",:decimal,precision: 15,scale: 2,default: 0
    end
    remove_column :salary_report_leader_lines,:basic_salary
    remove_column :salary_report_leader_lines,:pref_salary
    remove_column :salary_report_leader_lines,:post_salary
    remove_column :salary_report_leader_lines,:living_salary
  end
end
