#coding: utf-8
#项目过程审批
class CuxPa < ActiveRecord::Base
  WF_ITEM_TYPE = "CUXPRJWF"
  self.table_name = "cux_pa_process_a"
  self.primary_key = "project_id"
  # has_many :cux_pa_tasks,foreign_key: :project_id
  has_many :cux_pa_trast_headers,foreign_key: :project_id
  has_many :cux_pa_approver_list_his,foreign_key: :project_id
  belongs_to :wf_notification,foreign_key: :notification_id

  scope :bills_by_notification_ids,-> (n_ids) {select("
             T.NOTIFICATION_ID NOTIFICATION_ID,
             WF_NOTIFICATION.GETATTRTEXT(NID   => T.NOTIFICATION_ID,
                                         ANAME => 'PROJECT_NAME') PROJECT_NAME,
             WF_NOTIFICATION.GETATTRTEXT(NID   => T.NOTIFICATION_ID,
                                         ANAME => 'CARRYING_OUT_ORG_NAME') CARRYING_OUT_ORG_NAME,
             WF_NOTIFICATION.GETATTRTEXT(NID   => T.NOTIFICATION_ID,
                                         ANAME => 'CARRYING_OUT_ORG_ID') CARRYING_OUT_ORG_ID,
             WF_NOTIFICATION.GETATTRTEXT(NID   => T.NOTIFICATION_ID,
                                         ANAME => 'PROJECT_ID') PROJECT_ID,
             WF_NOTIFICATION.GETATTRTEXT(NID   => T.NOTIFICATION_ID,
                                         ANAME => 'PA_PROJECT_NUMBER') PA_PROJECT_NUMBER,
             WF_NOTIFICATION.GETATTRDATE(NID   => T.NOTIFICATION_ID,
                                         ANAME => 'WF_STARTED_DATE') WF_STARTED_DATE,
             WF_NOTIFICATION.GETATTRTEXT(NID   => T.NOTIFICATION_ID,
                                         ANAME => 'PROJECT_STATUS_NAME') PROJECT_STATUS_NAME,
             WF_NOTIFICATION.GETATTRTEXT(NID   => T.NOTIFICATION_ID,
                                         ANAME => 'PROJECT_TYPE') PROJECT_TYPE,
             WF_NOTIFICATION.GETATTRTEXT(NID   => T.NOTIFICATION_ID,
                                         ANAME => 'WORKFLOW_STARTED_BY_NAME') WORKFLOW_STARTED_BY_NAME,
             WF_NOTIFICATION.GETATTRTEXT(NID   => T.NOTIFICATION_ID,
                                         ANAME => 'PROJECT_APPROVER_FULL_NAME') PROJECT_APPROVER_FULL_NAME").
                                               from("WF_NOTIFICATIONS T").
                                               where("T.NOTIFICATION_ID IN (#{n_ids.join(',')})")
  }

  #审批记录
  def audit_his
    CuxPaApproverListHi.where(wf_item_type: wf_notification.message_type,wf_item_key: wf_notification.item_key)
  end

  #项目预算信息
  def pa_budet_info
    ret = plsql.cux_soa_mobile_app_pkg.GET_PA_BUDET_INF(project_id)
    ret[:x_pa_task_infos]
  end

  def id
    project_id
  end

  def self.unread_bills(n_ids)
    # sync_with_ebs(wf_itemkeys)
    self.bills_by_notification_ids(n_ids).to_json(methods: [:id])
  end

  #通过wf_itemkey更新需求数据
  def self.sync_with_ebs(wf_ids)
    CuxPaSoap.get_pa_pro_info(wf_ids)
    project_ids = CuxPa.where(notification_id: wf_ids)

    #同步任务预算信息
    project_ids.each {|p_id| CuxPaSoap.get_pa_budet_info(p_id)}
    #同步审批记录
    CuxPaPrmApproveHi.sync_with_ebs(project_ids)

    #同步资产信息
    # #同步附件
    # ids.each do |id|
    #   CuxSoaAttachedDocV.sync_with_ebs(id,"cux_pm_pre_projects_v")
    # end
  end
end
