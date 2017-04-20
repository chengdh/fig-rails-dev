#coding: utf-8
#库房管理
class SpecWarehousesController < BaseController
  table :warehouse_type_des,:org,:name,:location,:build_date,:building_area,:room_count,:fire_level_des,:max_volume,:act_volume, :is_camera_moniter, :is_fire_fighting_alarm_system, :is_auto_fire_fighting_system, :is_fire_hydrant_system, :is_lightning_protector, :is_active

  #导出查询结果为excel
  #GET spec_warehouses/export_excel
  def export_excel
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    spec_warehouses = @q.result
    set_collection_ivar(spec_warehouses)
    xls = render_to_string(partial: "excel_center_warehouse",layout: false)
    xls = show_or_hide_fields_for_export(xls)
    send_data xls,:filename => "仓库信息.xls"
  end


  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end


  private

  def spec_warehouse_params
    params.require(:spec_warehouse).permit(:warehouse_type, :name, :org_id, :location, :build_date, :building_area, :room_count, :fire_level, :max_volume, :act_volume, :is_camera_moniter, :is_fire_fighting_alarm_system, :is_auto_fire_fighting_system, :is_fire_hydrant_system, :is_lightning_protector, :is_active, :note)
  end
end

