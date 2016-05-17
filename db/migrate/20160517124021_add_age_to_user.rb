#coding: utf-8
#添加相关字段
class AddAgeToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :gender, :string,limit: 20
    add_column :users, :address, :string,limit: 60
  end
end
