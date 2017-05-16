#coding: utf-8
#总账明细
class CuxGlJeLine < ActiveRecord::Base
  belongs_to :cux_gl_je_header,foreign_key: :je_header_id
  self.table_name = "cux_demand_platform_lines_a"
  def self.sync_with_ebs(cux_gl_ids)
    cux_gl_ids.each do |gl_id|
      p_item_array = []
      p_item_array << {
        "VTYPE" => "NUM",
        "VNAME" => "je_header_id",
        "VVALUE" => gl_id,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
  end

end
