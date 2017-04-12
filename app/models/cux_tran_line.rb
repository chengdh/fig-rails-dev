#coding: utf-8
class CuxTranLine < ActiveRecord::Base
  self.table_name = "cux_transaction_lines_all_a"
  belongs_to :cux_tran
  def self.sync_with_ebs(cux_tran_ids)
    p_item_array = []
    cux_tran_ids.each do |cux_tran_id|
      p_item_array << {
        "VTYPE" => "NUM",
        "VNAME" => "cux_tran_id",
        "VVALUE" => cux_tran_id,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
  end
end
