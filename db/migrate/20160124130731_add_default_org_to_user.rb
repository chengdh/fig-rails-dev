#coding: utf-8
class AddDefaultOrgToUser < ActiveRecord::Migration
  def change
    add_column :users, :default_org_id, :integer
    add_column :users, :default_role_id, :integer
    add_column :users, :real_name, :string
    add_column :users, :is_active, :boolean,default: true
  end
end
