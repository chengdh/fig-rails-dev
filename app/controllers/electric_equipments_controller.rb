#coding: utf-8
class ElectricEquipmentsController < BaseController

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
