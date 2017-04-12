#coding: utf-8
class CuxDemandLine < ActiveRecord::Base
  self.table_name = "cux_demand_platform_lines_a"
  #default_scope -> {select("id as o_id",:cux_demand_id,:line_type,:apply_number,:item_number,:item_description,:item_spec,:item_price,:demand_quantiry,:line_bugdet)}
  def self.sync_with_ebs(cux_demand_ids)
    p_item_array = []
    cux_demand_ids.each do |cux_demand_id|
      p_item_array << {
        "VTYPE" => "NUM",
        "VNAME" => "cux_demand_id",
        "VVALUE" => cux_demand_id,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
  end
end
