#coding: utf-8
#审核奖励情况
class CheckRewardsController < RewardsController
  defaults :resource_class => Reward, :collection_name => 'rewards', :instance_name => 'reward'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => [:index,:search]
  #load_and_authorize_resource :training
  table :org,:name,:table_date,:check_state_des

  #GET check_rewards/:id/show_check
  #GET check_rewards/:id/show_check.json
  #显示审批界面
  def show_check
    @reward= Reward.find(params[:id])
  end
  private
  def reward_params
    params.require(:reward).permit(:org_id,:name, :table_date, :user_id, :checker_id, :check_state, :check_date, :note, :marks)
  end

end
