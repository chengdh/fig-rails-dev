#coding: utf-8
class PoLine < ActiveRecord::Base
  self.table_name = "po_lines_a"
  belongs_to :po_header
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
