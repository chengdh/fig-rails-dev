#coding: utf-8
#给机构表增加相关字段
class AddManangerToOrg < ActiveRecord::Migration
  def change
    add_column :orgs, :manager, :string,limit: 30
    add_column :orgs, :phone, :string,limit: 30
    add_column :orgs, :email, :string,limit: 30
  end
end
