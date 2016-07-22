#coding: utf-8
class ChangeUserIndex < ActiveRecord::Migration
  def change
    remove_index :users,:email
    change_column :users,:email,:string,null: true
  end
end
