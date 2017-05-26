#coding: utf-8
#前期立项审批
class CuxPmPreProject < ActiveRecord::Base
  self.table_name = "cux_pm_pre_projects_a"
  self.primary_key = "project_id"
  has_many :cux_pa_prm_approve_his,foreign_key: :entity_id
  #附件
  has_many :cux_soa_attached_doc_vs, -> {where(table_name: "cux_pm_pre_projects_v")},foreign_key: :pk1_column

  scope :bills_by_wf_itemkeys,-> (wf_itemkeys) {where(wf_item_key: wf_itemkeys)}

  def id
    project_id
  end

  def self.unread_bills(wf_itemkeys)
    # sync_with_ebs(wf_itemkeys)
    self.bills_by_wf_itemkeys(wf_itemkeys).to_json(methods: [:id])
  end

  #通过wf_itemkey更新需求数据
  def self.sync_with_ebs(wf_item_keys)
    wf_item_keys.each do |k|
      p_item_array =  []
      p_item_array << {
        "VTYPE" => "VAR",
        "VNAME" => "wf_item_key",
        "VVALUE" => k,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
    ids = CuxPmPreProject.where(wf_item_key: wf_item_keys).ids
    #同步审批记录
    CuxPaPrmApproveHi.sync_with_ebs(ids)
    #同步附件
    ids.each do |id|
      CuxSoaAttachedDocV.sync_with_ebs(id,"cux_pm_pre_projects_v")
    end
  end
  def self.audit(user_id,username,notification_id,b_pass,audit_note)
    # return {x_ret_code: '0',x_ret_message: '数据处理成功'}
    # ret = plsql.CUX_MOBILE_APP_PVT.GENERAL_APPROVAL(user_id,
    #                                                 username,
    #                                                 notification_id,
    #                                                 b_pass,
    #                                                 audit_note,
    #                                                 user_id)
    #
    #
    response = SoapApproval.general_approval(user_id,username,"",notification_id,b_pass,audit_note,"")
    {x_ret_code: response.body[:output_parameters][:x_ret_code],x_ret_message: response.body[:output_parameters][:x_ret_message]}
  end
end
