#coding: utf-8
class AssessmentsController < BaseController
  table :org,:name,:table_date,:check_state_des
  #PATCH assessments/:id/submit
  #提交考评表
  def submit
    @assessment = Assessment.find(params[:id])
    if @assessment.update_attributes(check_state: "submited",submit_date: Date.today,submiter: current_user)
      flash[:success] = "数据提交成功."
      redirect_to @assessment
    else
      flash[:error] = "数据提交失败"
      redirect_to :back
    end
  end
  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
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

