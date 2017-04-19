#coding: utf-8
#附件信息表
class CuxSoaAttachedDocV < ActiveRecord::Base
  self.primary_key = "media_id"
  self.table_name = "cux_soa_attached_doc_v"
  has_one :fnd_documents_short_text
  has_one :fnd_documents_long_text
  has_one :fnd_lob,foreign_key: :file_id

  #同步ebs
  def self.sync_with_ebs(ref_id,table_name)
    p_item_array = []
    p_item_array << {
      "VTYPE" => "VAR",
      "VNAME" => "pk1_column",
      "VVALUE" => ref_id,
      "VSIGN" => "EQ"
    }
    p_item_array << {
      "VTYPE" => "VAR",
      "VNAME" => "table_name",
      "VVALUE" => table_name,
      "VSIGN" => "EQ"
    }

    media_ids = TestSoap.sync_table(self,p_item_array)

    media_ids.each do |m_id|
      FndDocumentsShortText.sync_with_ebs(m_id)
      FndDocumentsLongText.sync_with_ebs(m_id)
      FndLob.sync_with_ebs(m_id)
    end if media_ids.present?
  end
end
