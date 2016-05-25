#coding: utf-8
#车辆信息管理
class VehiclesController < BaseController

  #导出查询结果为excel
  #GET vehicles/export_excel
  def export_excel
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    vehicles = @q.result
    set_collection_ivar(vehicles)
    xls = render_to_string(partial: "excel",layout: false)
    xls = show_or_hide_fields_for_export(xls)
    send_data xls,:filename => "交通工具.xls"
  end


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

