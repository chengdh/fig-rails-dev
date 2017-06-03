#coding: utf-8
class PoActionHistory < ActiveRecord::Base
  self.table_name = "po_action_history_a"
  belongs_to :po_header,foreign_key: :object_id
  def self.sync_with_ebs(po_header_ids)
    po_header_ids.each do |ph_id|
      p_item_array = []
      p_item_array << {
        "VTYPE" => "INT",
        "VNAME" => "object_id",
        "VVALUE" => ph_id,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
  end

end
