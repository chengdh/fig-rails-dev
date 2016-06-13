#coding: utf-8
class AddWageColumnsToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :grant_rate, :decimal,precision: 15,scale: 2,default: 0
    add_column :employees, :wage_before_last, :decimal,precision: 15,scale: 2,default: 0
    add_column :employees, :wage_last, :decimal,precision: 15,scale: 2,default: 0
    add_column :employees, :basic_salary, :decimal,precision: 15,scale: 2,default: 0
    add_column :employees, :pref_salary, :decimal,precision: 15,scale: 2,default: 0
    add_column :employees, :mth_pref_base, :decimal,precision: 15,scale: 2,default: 0
    add_column :employees, :year_pref_base, :decimal,precision: 15,scale: 2,default: 0
    add_column :employees, :pref_rate, :decimal,precision: 15,scale: 2,default: 0
    add_column :employees, :post_salary, :decimal,precision: 15,scale: 2,default: 0
    add_column :employees, :living_base, :decimal,precision: 15,scale: 2,default: 0
    add_column :employees, :living_salary_rate, :decimal,precision: 15,scale: 2,default: 0
    add_column :employees, :living_salary, :decimal,precision: 15,scale: 2,default: 0
  end
end
