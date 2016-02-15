#coding: utf-8
class LocationsController < BaseController
  table :warehouse,:name,:x,:y,:z

  protected
  def collection
    #只能看到本机构的库位信息
    @q= end_of_association_chain.joins(:warehouse).where("warehouses.org_id in (?)",current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end

  private

  def location_params
    params.require(:location).permit(:name, :warehouse_id, :x, :y, :z, :order_by, :is_active, :note)
  end
end

