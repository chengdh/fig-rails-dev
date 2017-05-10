#coding: utf-8
#发票审批记录
class ApWfapprovalHistory < ActiveRecord::Base
  self.table_name = "ap_wfapproval_history_v"
  belongs_to :cux_ap_invoice,foreign_key: :invoice_id
  def self.sync_with_ebs(inv_ids)
    inv_ids.each do |inv_id|
      p_item_array = []
      p_item_array << {
        "VTYPE" => "INT",
        "VNAME" => "invoice_id",
        "VVALUE" => inv_id,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
  end
end
