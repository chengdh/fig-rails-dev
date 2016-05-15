#coding: utf-8
#劳动防护用品
class ProtectEquipmentsController < BaseController
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

