#coding: utf-8
class AddUsernameToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string,null: false,uniq:true,limit: 30
    add_index :users,:username
  end
end
