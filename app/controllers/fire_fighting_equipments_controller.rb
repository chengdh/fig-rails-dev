#coding: utf-8
class FireFightingEquipmentsController < BaseController
  table :org,:name,:location,:model,:qty,:unit,:out_factory_date,:use_year,:valid_date,:last_upkeep_date,:duty_person

  #导出查询结果为excel
  #GET fire_fighting_equipments/export_excel
  def export_excel
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    ffqs = @q.result
    set_collection_ivar(ffqs)
    xls = render_to_string(partial: "excel",layout: false)
    xls = show_or_hide_fields_for_export(xls)
    send_data xls,:filename => "消防设施.xls"
  end


  protected
  def collection
    #只能看到本机构的消防设施信息
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end
  private
  def fire_fighting_equipment_params
    params.require(:fire_fighting_equipment).permit(:org_id, :name, :model, :location, :qty, :out_factory_date, :valid_date, :last_upkeep_date, :note, :is_active, :user_id, :duty_person)
  end
end
