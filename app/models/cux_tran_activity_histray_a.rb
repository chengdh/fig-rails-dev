#coding: utf-8
class CuxTranActivityHistrayA < ActiveRecord::Base
  self.primary_key = "notification_id"
  self.table_name = "cux_tran_activity_history_a"

  belongs_to :cux_tran,foreign_key: :item_key,primary_key: :wf_itemkey
  def cux_tran_id
    cux_tran.id
  end

  def self.sync_with_ebs(wf_itemkey_array)
    wf_itemkey_array.each do |wf_itemkey|
      p_item_array = []
      p_item_array << {
        "VTYPE" => "VAR",
        "VNAME" => "item_key",
        "VVALUE" => wf_itemkey,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
  end

end
