#coding: utf-8
#个人工作台
class DashboardController < ApplicationController
  def index
    #待处理任务
    @waitting_process_tasks = Task.waitting_process(current_user.id)
    #待确认任务
    @waitting_finish_tasks = Task.waitting_finish(current_user.id)

    #教育培训-待审批
    @waitting_trainings = Training.waitting_confirm(current_ability_org_ids)
    #已拒绝
    @rejected_trainings = Training.rejected(current_user.current_org.id)

    #应急预案-待审批
    @waitting_planb_docs = PlanbDoc.waitting_confirm(current_ability_org_ids)
    #已拒绝
    @rejected_planb_docs = PlanbDoc.rejected(current_user.current_org.id)

    #会议记录-待审批
    @waitting_meetings = Meeting.waitting_confirm(current_ability_org_ids)
    #已拒绝
    @rejected_meetings = Meeting.rejected(current_user.current_org.id)

    #事故隐患
    @waitting_hidden_dangers = HiddenDanger.waitting_process(current_ability_org_ids)
    #已拒绝
    @rejected_meetings = HiddenDanger.waitting_review(current_ability_org_ids)

    #消防器材
    @expired_fire_fighting_equipments = FireFightingEquipment.expired(current_ability_org_ids)

  end
  private
  #当前可用机构的ids
  def current_ability_org_ids
    default_org = current_user.current_org
    ret = ActiveSupport::OrderedHash.new
    child_org_ids = default_org.children.map {|child_org|  child_org.id}
    [default_org.id] + child_org_ids
  end

end
