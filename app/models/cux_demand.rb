#coding: utf-8
class CuxDemand < ActiveRecord::Base
  self.table_name = "cux_demand_platform_headers_a"
  self.primary_key = "id"
  has_many :cux_demand_lines
  # has_many :cux_deman_audit_hises,foreign_key: :item_key
  scope :bills_by_wf_itemkeys,-> (wf_itemkeys) {where(wf_itemkey: wf_itemkeys).includes(:cux_demand_lines)}

  #审批历史记录
  def audit_his
    CuxDemandAuditHis.where(item_key: wf_itemkey)
  end

  #附件表
  def attatches
    CuxSoaAttachedDocV.where(pk1_column: id,table_name: "cux_demand_platform_headers")
  end

  def self.unread_bills(wf_itemkeys)
    sync_with_ebs(wf_itemkeys)
    self.bills_by_wf_itemkeys(wf_itemkeys).to_json(include: :cux_demand_lines)
  end

  #通过wf_itemkey更新需求数据
  def self.sync_with_ebs(wf_item_keys)
    p_item_array = []
    wf_item_keys.each do |k|
      p_item_array << {
        "VTYPE" => "VAR",
        "VNAME" => "wf_itemkey",
        "VVALUE" => k,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
    cux_demand_ids = CuxDemand.where(wf_itemkey: wf_item_keys).ids
    CuxDemandLine.sync_with_ebs(cux_demand_ids)
    CuxDemandAuditHis.sync_with_ebs(wf_item_keys)
    #同步附件
    cux_demand_ids.each do |cm_id|
      CuxSoaAttachedDocV.sync_with_ebs(cm_id,"cux_demand_platform_headers")
    end
  end
  def self.audit(user_id,username,notification_id,b_pass,audit_note)
    # ret = plsql.CUX_MOBILE_APP_PVT.GENERAL_APPROVAL(user_id,
    #                                                 username,
    #                                                 notification_id,
    #                                                 b_pass,
    #                                                 audit_note,
    #                                                 user_id)
    #
    response = SoapApproval.general_approval(user_id,username,"",notification_id,b_pass,audit_note,"")
    {x_ret_code: response.body[:output_parameters][:x_ret_code],x_ret_message: response.body[:output_parameters][:x_ret_message]}
  end
end
