#coding: utf-8
class ChangeUserTable < ActiveRecord::Migration
  def change
    #修改用户表
    #添加user_name及status字段
    add_column :users,:user_name,:string,null: false,limit: 30
    add_column :users,:status,:boolean,null: false,default: true
    change_column :users,:email,:string,null: true,limit: 60
    remove_column :users,:touch_man
    remove_column :users,:address
    remove_column :users,:company_name
  end
end
