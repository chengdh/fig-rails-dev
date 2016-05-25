#coding: utf-8
#司机信息
class DriversController < BaseController
  #导出查询结果为excel
  #GET drivers/export_excel
  def export_excel
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    ffqs = @q.result
    set_collection_ivar(ffqs)
    xls = render_to_string(partial: "excel",layout: false)
    xls = show_or_hide_fields_for_export(xls)
    send_data xls,:filename => "驾驶员信息.xls"
  end


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

