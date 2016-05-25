#coding: utf-8
class AddBrandToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment,:brand,:string,limit: 60
  end
end
