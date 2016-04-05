#coding: utf-8
class AddTargetToSystemFunction < ActiveRecord::Migration
  def change
    add_column :system_functions, :target, :string,limit: 30
  end
end
