#coding: utf-8
class AddUsernameAndPasswordToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :username, :string,limit: 60
    add_column :websites, :password, :string,limit: 60
  end
end
