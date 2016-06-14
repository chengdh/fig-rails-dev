#coding: utf-8
#vpn帐号理
class VpnInfosController < BaseController
  include ControllerStateMachine
  table :org,:table_date,:user,:check_state_des
  def new
    @vpn_info = resource_class.new
    (1..10).each {|i| @vpn_info.vpn_info_lines.build }
  end

  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end

  private
  def vpn_info_params
    params.require(:vpn_info).permit(:org_id, :check_state, :user_id,
                                         :submitter_id,:submit_date,:check_state,:checker_id,:check_opinion,:check_date,
                                         :note,:table_date)
  end
end
