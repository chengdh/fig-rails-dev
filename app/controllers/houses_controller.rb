#coding: utf-8
class HousesController < BaseController
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

