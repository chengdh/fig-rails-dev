#coding: utf-8
class AddMthToAccident < ActiveRecord::Migration
  def change
    add_column :accidents, :mth, :string,limit: 6,null: false
  end
end
