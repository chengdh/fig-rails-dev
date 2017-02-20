#coding: utf-8
class CuxDemandLine < ActiveRecord::Base
  self.table_name = "cux_demand_platform_lines_a"
  #default_scope -> {select("id as o_id",:cux_demand_id,:line_type,:apply_number,:item_number,:item_description,:item_spec,:item_price,:demand_quantiry,:line_bugdet)}
end
