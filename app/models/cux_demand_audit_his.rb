#coding: utf-8
class CuxDemandAuditHis < ActiveRecord::Base
  self.table_name = "cux_posa_item_activity_his_a"
  def self.sync_with_ebs(wf_itemkey_array)
    p_item_array = []
    wf_itemkey_array.each do |wf_itemkey|
      p_item_array << {
        "VTYPE" => "VAR",
        "VNAME" => "item_key",
        "VVALUE" => wf_itemkey,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
  end
end
