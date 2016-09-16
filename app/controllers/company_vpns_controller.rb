#coding: utf-8
#城区分公司VPN帐号管理
class CompanyVpnsController < BaseController
  include ControllerStateMachine
  table :org,:table_date,:user,:check_state_des
  def new
    @company_vpn = resource_class.new
    (1..10).each {|i| @company_vpn.company_vpn_lines.build }
  end

  #GET vpn_infos/search_line
  def search_lines
    @q = CompanyVpnLine.ransack(params[:q])
    @company_vpn_lines = @q.result.paginate(:page => params[:page])
  end

  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end


  private
  def company_vpn_params
    params.require(:company_vpn).permit(:org_id, :table_date, :user_id, :submitter_id, :submit_date, :submit_note, :checker_id, :check_date, :check_opinion, :note, :check_state)
  end
end
