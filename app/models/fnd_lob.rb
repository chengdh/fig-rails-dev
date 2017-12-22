#coding: utf-8
#大数据附件
class FndLob < ActiveRecord::Base
  self.primary_key = "file_id"
  self.table_name = "fnd_lob"
  default_scope {order("file_id ASC")}
  belongs_to :cux_soa_attached_doc_v,foreign_key: :file_id
  #同步ebs
  def self.sync_with_ebs(file_id)
    p_item_array = []
    p_item_array << {
      "VTYPE" => "VAR",
      "VNAME" => "file_id",
      "VVALUE" => file_id,
      "VSIGN" => "EQ"
    }
    TestSoap.sync_table(self,p_item_array)
  end

  def cux_soa_attached_doc_v_id
    file_id
  end

end
