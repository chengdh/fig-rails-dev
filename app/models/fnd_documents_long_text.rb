#coding: utf-8
#长文本内容表
class FndDocumentsLongText < ActiveRecord::Base
  self.primary_key = "media_id"
  self.table_name = "fnd_documents_long_text"
  belongs_to :cux_soa_attached_doc_v,foreign_key: :media_id

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

  def cux_soa_attached_doc_v_id
   media_id
  end
end
