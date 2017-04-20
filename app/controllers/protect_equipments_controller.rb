#coding: utf-8
#劳动防护用品
class ProtectEquipmentsController < BaseController
  table :protect_equipment_category,:deliver_org,:post_des,:save_days,:maintain_days,:note

  #导出查询结果为excel
  #GET protect_equipments/export_excel
  def export_excel
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    protect_equipments = @q.result
    set_collection_ivar(protect_equipments)
    xls = render_to_string(partial: "excel",layout: false)
    xls = show_or_hide_fields_for_export(xls)
    send_data xls,:filename => "劳动防护用品清单.xls"
  end

  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end

  private
  def protect_equipment_params
    params.require(:protect_equipment).permit(:protect_equipment_category_id, :org_id, :name, :deliver_org_id, :post, :qty, :unit_id, :save_days, :maintain_days, :is_active, :note)
  end
end

