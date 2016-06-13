#coding: utf-8
class AddColumnsToSalaryTableLine < ActiveRecord::Migration
  def change
    add_column :salary_table_lines, :grant_rate, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_table_lines, :wage_before_last, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_table_lines, :wage_last, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_table_lines, :basic_salary, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_table_lines, :pref_salary, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_table_lines, :mth_pref_base, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_table_lines, :year_pref_base, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_table_lines, :pref_rate, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_table_lines, :post_salary, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_table_lines, :living_base, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_table_lines, :living_salary_rate, :decimal,precision: 15,scale: 2,default: 0
    add_column :salary_table_lines, :living_salary, :decimal,precision: 15,scale: 2,default: 0
  end
end
