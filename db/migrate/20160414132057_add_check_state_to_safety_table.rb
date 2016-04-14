#coding: utf-8
class AddCheckStateToSafetyTable < ActiveRecord::Migration
  def change
    add_column :safety_tables, :check_state, :string,limit: 30,default: "draft"
  end
end
