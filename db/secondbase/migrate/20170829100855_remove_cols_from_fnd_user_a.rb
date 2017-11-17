#coding: utf-8
class RemoveColsFromFndUserA < ActiveRecord::Migration
  def change
    remove_column :fnd_user_a,:web_password
    # remove_column :fnd_user_a,:user_guid
  end
end
