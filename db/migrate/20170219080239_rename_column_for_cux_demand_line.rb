#coding: utf-8
class RenameColumnForCuxDemandLine < ActiveRecord::Migration
  def change
    rename_column :cux_demand_platform_lines_a,:item_descripton,:item_description
    rename_column :cux_demand_platform_lines_a,:line_budget,:line_bugdet
  end
end
