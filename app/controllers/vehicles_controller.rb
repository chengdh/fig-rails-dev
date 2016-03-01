#coding: utf-8
#车辆信息管理
class VehiclesController < BaseController

  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end

  private
  def vehicle_params
    params.require(:vehicle).permit(:vehicle_no, :model, :register_no, :license_no, :buy_date, :expire_date, :last_check_date, :is_active, :note)
  end
end

