#coding: utf-8
#库存查询
class StocksController < BaseController
  def collection
    @q= end_of_association_chain.where(location_id: current_ability_locations_ids).ransack(params[:q])
    set_collection_ivar(@q.result.paginate(:page => params[:page]))
  end
  private
  def current_ability_locations_ids
    ret = []
    Warehouse.where(is_active: true,org_id: current_ability_org_ids).each do |w|
      ret += w.locations.where(location_type: "normal_loc")
    end
    ret.map {|l| l.id}
  end
end
