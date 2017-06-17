#coding: utf-8
#项目过程审批
class CuxPa < ActiveRecord::Base
  WF_ITEM_TYPE = "CUXPRJWF"
  self.table_name = "cux_pas"
  self.primary_key = "project_id"
  has_many :cux_pa_tasks,foreign_key: :project_id
  has_many :cux_pa_trast_headers,foreign_key: :project_id
  has_many :cux_pa_approver_list_his,foreign_key: :project_id

  scope :bills_by_notification_ids,-> (n_ids) {where(notification_id: n_ids)}
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
