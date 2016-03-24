#coding: utf-8
#考评表审批
class CheckAssessmentsController < AssessmentsController
  defaults :resource_class => Assessment, :collection_name => 'assessments', :instance_name => 'assessment'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => :index
  #load_and_authorize_resource :training
  table :org,:name,:table_date,:check_state_des

  #GET assessments/:id/show_check
  #GET assessments/:id/show_check.json
  #显示审批界面
  def show_check
    @assessment = Assessment.find(params[:id])
  end
  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids,check_state: ["submited","confirmed","rejected"]).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end


  private
  def assessment_params
    params.require(:assessment).permit(:org_id, :table_date, :mth, :check_state, :user_id,:submiter_id,:submit_date, :checker_id,
                                       :check_date,:check_opinion, :name, :note,:k_safety_table_marks,:k_accident_marks,
                                       :k_training_marks,
                                       :k_planb_doc_marks,
                                       :k_meeting_marks,
                                       :k_hidden_danger_marks,
                                       :k_big_hidden_danger_marks,
                                       :k_big_accident_marks,
                                       :k_punishment_marks,
                                       :reward_marks)
  end

end
