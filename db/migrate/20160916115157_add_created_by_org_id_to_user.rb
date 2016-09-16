#coding: utf-8
class AddCreatedByOrgIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :created_by_org_id, :integer
  end
end
