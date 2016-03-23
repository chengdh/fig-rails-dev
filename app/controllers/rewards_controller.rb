#coding: utf-8
#奖励情况
class RewardsController < BaseController
  table :org,:name,:table_date,:check_state_des

  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end


  private
  def reward_params
    params.require(:reward).permit(:org_id,:name, :table_date, :user_id, :checker_id, :check_state, :check_date, :note, :marks)
  end
end

