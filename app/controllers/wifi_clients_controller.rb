#coding: utf-8
#wifi帐号管理
class WifiClientsController < BaseController
  include ControllerStateMachine
  table :org,:table_date,:user,:check_state_des
  def new
    @wifi_client= resource_class.new
    (1..10).each {|i| @wifi_client.wifi_client_lines.build }
  end

  #GET wifi_clients/search_line
  def search_lines
    @q = WifiClientLine.ransack(params[:q])
    @wifi_client_lines = @q.result.paginate(:page => params[:page])
  end

  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end

  private
  def wifi_client_params
    params.require(:wifi_client).permit(:org_id, :user_id, :check_state, :table_date, :note, :submitter_id, :submit_date, :checker_id, :check_date, :check_opinion)
  end
end
