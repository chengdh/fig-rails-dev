#coding: utf-8
class AddCodeToSalaryItemHeader < ActiveRecord::Migration
  def change
    add_column :salary_item_headers, :code, :string,limit: 60
  end
end
