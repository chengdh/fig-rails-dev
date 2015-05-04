#coding: utf-8
class AddUserIdToRegisterInfo < ActiveRecord::Migration
  def change
    add_column :register_infos, :user_id, :integer
  end
end
