#coding: utf-8
#前期立项审批
class CuxPmPreProject < ActiveRecord::Base
  self.table_name = "cux_pm_pre_projects_a"
  self.primary_key = "project_id"
  has_many :cux_pa_prm_approve_his,foreign_key: :entity_id
  #附件
  has_many :cux_soa_attached_doc_vs, -> {where(table_name: "cux_pm_pre_projects_v")},foreign_key: :pk1_column

  scope :bills_by_notification_ids,-> (n_ids) {where(notification_id: n_ids)}

  def id
    project_id
  end

  def self.unread_bills(n_ids)
    # sync_with_ebs(wf_itemkeys)
    self.bills_by_notification_ids(n_ids).to_json(methods: [:id])
  end

  #通过wf_itemkey更新需求数据
  def self.sync_with_ebs(p_user_id)
    n_ids = CuxPmPreProjectSoap.get_prm_notify(p_user_id)
    ids = CuxPmPreProjectSoap.get_prm_projects(n_ids)
    #同步审批记录
    CuxPaPrmApproveHi.sync_with_ebs(ids)
    #同步附件
    ids.each do |id|
      CuxSoaAttachedDocV.sync_with_ebs(id,"cux_pm_pre_projects_v")
    end
  end

  #FIXME 未测试
  def self.audit(p_user_id,p_username,p_next_user_ids,p_project_id,p_notification_id,p_app_result_code,p_app_result_note,p_status_lookup_code= nil)
    # return {x_ret_code: '0',x_ret_message: '数据处理成功'}
    # ret = plsql.CUX_MOBILE_APP_PVT.GENERAL_APPROVAL(user_id,
    #                                                 username,
    #                                                 notification_id,
    #                                                 b_pass,
    #                                                 audit_note,
    #                                                 user_id)
    #
    #
    response = CuxPmPreProjectSoap.approval(p_user_id,p_username,p_next_user_ids,p_project_id,p_notification_id,p_app_result_code,p_app_result_note,p_status_lookup_code= nil)
    {x_ret_code: response.body[:output_parameters][:x_ret_code],x_ret_message: response.body[:output_parameters][:x_ret_message]}
  end
end
