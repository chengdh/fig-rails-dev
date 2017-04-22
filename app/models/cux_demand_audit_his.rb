#coding: utf-8
class CuxDemandAuditHis < ActiveRecord::Base
  self.table_name = "cux_posa_item_activity_his_a"
  self.primary_key = "notification_id"
  belongs_to :cux_demand,foreign_key: :item_key,primary_key: :wf_itemkey

  #为手机app端兼容定义
  def cux_demand_id
    cux_demand.id
  end

  def self.sync_with_ebs(wf_itemkey_array)
    p_item_array = []
    wf_itemkey_array.each do |wf_itemkey|
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
