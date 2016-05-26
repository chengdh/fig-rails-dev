#coding: utf-8
class HousesController < BaseController
  #导出查询结果为excel
  #GET houses/export_excel
  def export_excel
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    houses = @q.result
    set_collection_ivar(houses)
    xls = render_to_string(partial: "excel",layout: false)
    xls = show_or_hide_fields_for_export(xls)
    send_data xls,:filename => "闲置房社及院落清单.xls"
  end


  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end

  private

  def house_params
    params.require(:house).permit(:org_id, :name, :location, :build_date, :building_area, :is_rent, :usage, :have_safe_contract, :rent_to, :is_active, :note)
  end
end

