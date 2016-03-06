#coding: utf-8
#培训记录
class TrainingsController < BaseController
  table :org,:name,:training_date,:teachers,:training_length,:check_state_des

    protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids,check_state: ["draft","rejected"]).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end


  private
  def training_params
    params.require(:training).permit(:org_id, :table_date, :user_id, :name, :training_date, :teachers, :training_length, :join_persons, :join_count, :training_content, :is_assess, :assess_type, :qualified_rate, :check_state, :check_opinion, :checker_id)
  end
end

