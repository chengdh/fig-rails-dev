#coding: utf-8
#仓库管理
class WarehousesController < BaseController
  table :org,:name,:address,:leader,:phone,:area,:volume
  protected
  def collection
    #只能看到本机构的仓库信息
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end


  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :org_id, :warehouse_type_id, :default_location_id, :address, :leader, :order_by, :is_active, :phone, :area, :volume, :note)
  end
end

