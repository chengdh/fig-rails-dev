#coding: utf-8
#给salary_table表添加type字段
class AddTypeToSalaryTable < ActiveRecord::Migration
  def change
    add_column :salary_tables, :type, :string,limit: 60
  end
end
