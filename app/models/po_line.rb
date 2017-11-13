#coding: utf-8
class PoLine < ActiveRecord::Base
  self.table_name = "po_lines_a"
  belongs_to :po_header

  #含税金额
  def line_amt
    attribute2.try(:to_f) * quantity.to_i
  end

  #不含税金额
  #TODO 算法
  def line_amt_without_tax
    unit_price * quantity.to_i
  end
  def self.sync_with_ebs(po_header_ids)
    po_header_ids.each do |ph_id|
      p_item_array = []
      p_item_array << {
        "VTYPE" => "NUM",
        "VNAME" => "po_header_id",
        "VVALUE" => ph_id,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
  end
end
