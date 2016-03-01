#coding: utf-8
#司机信息
class DriversController < BaseController
  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end


  private
  def driver_params
    params.require(:driver).permit(:org_id, :name, :vehicle_id, :driver_no, :id_no, :mobile, :next_check_date, :is_active, :note)
  end
end

