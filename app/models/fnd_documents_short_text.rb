#coding: utf-9
#短文本内容表
class FndDocumentsShortText < ActiveRecord::Base
  self.primary_key = "media_id"
  self.table_name = "fnd_documents_long_text"
  belongs_to :cux_soa_attached_doc_v
  #同步ebs
  def self.sync_with_ebs(media_id)
    p_item_array = []
    p_item_array << {
      "VTYPE" => "VAR",
      "VNAME" => "media_id",
      "VVALUE" => media_id,
      "VSIGN" => "EQ"
    }
    TestSoap.sync_table(self,p_item_array)
  end

end