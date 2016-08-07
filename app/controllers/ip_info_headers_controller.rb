#coding: utf-8
#ip 地址管理
class IpInfoHeadersController < BaseController
  include ControllerStateMachine
  table :org,:table_date,:user,:check_state_des
  def new
    @ip_info_header = IpInfoHeader.new
    (1..10).each {|i| @ip_info_header.ip_info_lines.build }
  end

  #GET ip_info_headers/search_line
  def search_lines
    @q = IpInfoLine.ransack(params[:q])
    @ip_info_lines = @q.result.paginate(:page => params[:page])
  end

  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids(3)).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end

  private
  def ip_info_header_params
    params.require(:ip_info_header).permit(:org_id, :state, :user_id,
                                         :submitter_id,:submit_date,:check_state,:checker_id,:check_opinion,:check_date,
                                         :note,:table_date)
  end
end

