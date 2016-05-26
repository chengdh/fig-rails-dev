#coding: utf-8
#特种设备管理
class SpecEquipmentsController < BaseController
  table :org,:equip_type_des,:equip_date,:vendor,:model,:location,:ton,:volume,:usage,:last_check_date

  #导出查询结果为excel
  #GET spec_equipments/export_excel
  def export_excel
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    ffqs = @q.result
    set_collection_ivar(ffqs)
    xls = render_to_string(partial: "excel_#{params[:q][:equip_type_eq]}",layout: false)
    xls = show_or_hide_fields_for_export(xls)
    send_data xls,:filename => "特种设备.xls"
  end

  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end

  private
  def spec_equipment_params
    params.require(:spec_equipment).permit(:equip_type, :org_id, :equip_date, :vendor, :model, :location, :ton, :volume, :usage, :last_check_date, :note, :is_active)
  end
end

