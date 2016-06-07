#coding: utf-8
#模板对应的员工筛选条件
class AddEmployeeWhereToSalaryItemHeader < ActiveRecord::Migration
  def change
    add_column :salary_item_headers, :employee_where, :text
  end
end
