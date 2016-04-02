#coding: utf-8
#给组织机构添加编码
class AddCodeToOrg < ActiveRecord::Migration
  def change
    add_column :orgs, :code, :string,limit: 30
  end
end
