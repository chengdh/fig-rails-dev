#coding: utf-8
class AddIsActiveToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :is_active, :boolean,default: true
  end
end
