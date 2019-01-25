#coding: utf-8
class AddWfItemkey2CuxDemand < ActiveRecord::Migration
  def change
    add_column :cux_demand_platform_headers_a,:wf_itemkey,:string,limit: 60
  end
end
