#coding: utf-8
#培训记录
class TrainingsController < BaseController
  include ControllerStateMachine
  table :org,:name,:training_date,:teachers,:training_length,:check_state_des

  #PATCH accident_headers/:id/submit
  #提交月报
  def submit
    @training = Training.find(params[:id])
    if @training.update_attributes(submitter_id: current_user.id,submit_date: Date.today,check_state: "submitted")
      flash[:success] = "数据已正常提交!"
      redirect_to resource
    else
      flash[:error] = "数据提交失败!"
      redirect_to :back
    end
  end

  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end


  private
  def training_params
    params.require(:training).permit(:org_id, :table_date, :user_id, :name, :training_date, :teachers, :training_length, :join_persons, :join_count, :training_content, :is_assess, :assess_type, :qualified_rate, :check_state, :check_opinion, :checker_id)
  end
end

