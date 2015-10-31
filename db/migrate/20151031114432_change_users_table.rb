#coding: utf-8
class ChangeUsersTable < ActiveRecord::Migration
  def change
    change_column :users,:email,:string,null: true
    change_column :users,:company_name,:string,null: true
    change_column :users,:address,:string,null: true
    change_column :users,:phone,:string,null: true
    change_column :users,:touch_man,:string,null: true
  end
end
