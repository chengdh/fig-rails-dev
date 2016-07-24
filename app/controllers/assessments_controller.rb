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

  #年度汇总
  def year_report
    @q= resource_class.select(
      "org_id," +
      "LEFT(mth,4) AS year,SUM(k_safety_table_marks) AS k_safety_table_marks,"+
      "SUM(k_accident_marks) AS k_accident_marks," +
      "SUM(k_training_marks) AS k_training_marks," +
      "SUM(k_planb_doc_marks) AS k_planb_doc_marks," +
      "SUM(k_files_marks) AS k_files_marks," +
      "SUM(k_meeting_marks) AS k_meeting_marks," +
      "SUM(k_hidden_danger_marks) AS k_hidden_danger_marks,"+
      "SUM(k_big_hidden_danger_marks) AS k_big_hidden_danger_marks,"+
      "SUM(k_big_accident_marks) AS k_big_accident_marks"
    ).where(org_id: current_ability_org_ids).group("org_id,LEFT(mth,4)").ransack(params[:q])
    @assessments = @q.result
  end
  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end


  private
  def assessment_params
    params.require(:assessment).permit(:org_id, :table_date, :mth, :check_state, :user_id,:submiter_id,:submit_date, :checker_id,
                                       :check_date,:check_opinion, :name, :note,
                                       :k_safety_table_marks,
                                       :k_accident_marks,
                                       :k_training_marks,
                                       :k_planb_doc_marks,
                                       :k_files_marks,
                                       :k_meeting_marks,
                                       :k_hidden_danger_marks,
                                       :k_big_hidden_danger_marks,
                                       :k_big_accident_marks,
                                       :k_punishment_marks,
                                       :reward_marks)
  end
end

