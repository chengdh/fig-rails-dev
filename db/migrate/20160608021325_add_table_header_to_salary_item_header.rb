#coding: utf-8
#工资模板表头处理
class AddTableHeaderToSalaryItemHeader < ActiveRecord::Migration
  def change
    add_column :salary_item_headers, :table_header, :text
  end
end
