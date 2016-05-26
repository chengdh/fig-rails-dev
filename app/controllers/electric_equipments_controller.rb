#coding: utf-8
class ElectricEquipmentsController < BaseController

  #导出查询结果为excel
  #GET electric_equipments/:id/export_excel
  def export_excel
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    eqs= @q.result
    set_collection_ivar(eqs)
    xls = render_to_string(partial: "excel",layout: false)
    xls = show_or_hide_fields_for_export(xls)
    send_data xls,:filename => "电气设备.xls"
  end

  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end

  private

  def electric_equipment_params
    params.require(:electric_equipment).permit(:org_id, :area, :fire_level, :build_date, :manage_org, :qty, :buy_date, :power, :work_type, :last_check_date, :is_active, :note)
  end
end
