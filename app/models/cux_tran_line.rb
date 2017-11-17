#coding: utf-8
class CuxTranLine < ActiveRecord::Base
  self.table_name = "cux_transaction_lines_all_a"
  belongs_to :cux_tran,foreign_key: :require_id

  #客户端返回json时,返回的主表id
  def cux_tran_id
    require_id
  end
  def self.sync_with_ebs(cux_tran_ids)
    cux_tran_ids.each do |cux_tran_id|
      p_item_array = []
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
