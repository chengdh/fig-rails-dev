#coding: utf-8
#给用户表添加username字段
class ChangeUserModel < ActiveRecord::Migration
  def change
    add_column :users,:username,:string,limit: 30,null: false
    User.create(username: "admin",password: "admin",is_admin: true)
  end
end
