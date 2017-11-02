#coding: utf-8
#前期立项审批
class CuxPmPreProject < ActiveRecord::Base
  self.table_name = "cux_pm_pre_projects_a"
  self.primary_key = "project_id"
  has_many :cux_pa_prm_approve_his,foreign_key: :entity_id
  #附件
  has_many :cux_soa_attached_doc_vs, -> {where(table_name: "cux_pm_pre_projects_v")},foreign_key: :pk1_column

  belongs_to :wf_notification,foreign_key: :notification_id

  scope :bills_by_notification_ids,-> (n_ids) {from("
          (SELECT CH.ENTITY_ID, WN.NOTIFICATION_ID
          FROM CUX_APPROVER_LIST_HEADERS CH,
               CUX_APPROVER_LIST_LINES   CL,
               WF_NOTIFICATIONS          WN
         WHERE CL.LIST_HEADER_ID = CH.LIST_HEADER_ID
           AND CL.WF_ITEM_TYPE IS NOT NULL
           AND CL.WF_ITEM_TYPE = WN.MESSAGE_TYPE
           AND CL.WF_ITEM_KEY = WN.ITEM_KEY
           AND CH.ENTITY = 'CUX_PM_PRE_PROJECTS_ALL'
           AND WN.NOTIFICATION_ID IN (#{n_ids.join(',')})
         GROUP BY CH.ENTITY_ID, WN.NOTIFICATION_ID) CHA,CUX_PM_PRE_PROJECTS_A CPA").
           select("CPA.*, CHA.NOTIFICATION_ID").where(" CPA.project_id = CHA.ENTITY_ID")}

  def id
    project_id
  end
  #工作流标题
  def wf_title
    wf_notification.try(:subject)
  end

  #工作流发起人
  def wf_from_user
    wf_notification.try(:from_user)
  end

  #工作流发起时间
  def wf_begin_date
    wf_notification.try(:begin_date)
  end

  def self.unread_bills(n_ids)
    # sync_with_ebs(wf_itemkeys)
    self.bills_by_notification_ids(n_ids).to_json(methods: [:id])
  end
  def self.unread_bills_v2(user_id)
    n_ids = WfNotification.unread_for_cux_pm_pre_projects(user_id).pluck(:notification_id)
    if n_ids.present?
    # sync_with_ebs(wf_itemkeys)
      self.bills_by_notification_ids(n_ids).to_json(
        methods: [:id,:wf_title,:wf_from_user,:wf_begin_date]
      )
    else
      []
    end
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
