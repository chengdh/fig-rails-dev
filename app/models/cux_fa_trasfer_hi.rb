#coding: utf-8
#固定资产转移审批
class CuxFaTrasferHi < ActiveRecord::Base
  self.table_name = "cux_fa_trasfer_his"
  def self.sync_with_ebs(header_ids)
    header_ids.each do |h_id|
      p_item_array = []
      p_item_array << {
        "VTYPE" => "NUM",
        "VNAME" => "header_id",
        "VVALUE" => h_id,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
  end
end
