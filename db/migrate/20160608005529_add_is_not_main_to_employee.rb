#coding: utf-8
class AddIsNotMainToEmployee < ActiveRecord::Migration
  def change
    #是否三产人员
    add_column :employees, :is_not_main, :boolean,default: false
  end
end
