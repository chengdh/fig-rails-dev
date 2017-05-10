#coding: utf-8
#应付发票行
class CuxApInvoiceLine < ActiveRecord::Base
  self.table_name = "cux_ap_invoice_lines_a"
  belongs_to :cux_ap_invoide,foreigh_key: :invoice_id
  def self.sync_with_ebs(inv_ids)
    inv_ids.each do |inv_id|
      p_item_array = []
      p_item_array << {
        "VTYPE" => "NUM",
        "VNAME" => "invoice_id",
        "VVALUE" => inv_id,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
  end
end
