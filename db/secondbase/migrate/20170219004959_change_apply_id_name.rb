#coding: utf-8
class ChangeApplyIdName < ActiveRecord::Migration
  def change
    rename_column :cux_demand_platform_lines_a,:apply_id,:cux_demand_id
  end
end
