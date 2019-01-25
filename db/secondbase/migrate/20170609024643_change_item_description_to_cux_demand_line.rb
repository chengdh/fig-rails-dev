#coding: utf-8
class ChangeItemDescriptionToCuxDemandLine < ActiveRecord::Migration
  def change
    change_column :cux_demand_platform_lines_a,:item_description,:string,:limit => 255
    change_column :cux_demand_platform_lines_a,:item_spec,:string,:limit => 255
  end
end
