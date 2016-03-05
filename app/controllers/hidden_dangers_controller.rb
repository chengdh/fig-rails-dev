#coding: utf-8
#隐患整改
class HiddenDangersController < BaseController
  table :org,:danger_org,:name,:danger_date,:fix_period_des,:fixed_state_des,:review_date,:review_state_des
  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end


  private

  def hidden_danger_params
    params.require(:hidden_danger).permit(:org_id, :danger_org_id, :parent_id, :name, :danger_date, :fix_period, :fixed_state, :fixed_date, :fixer_id, :review_date, :review_state, :reviewer_id, :note)
  end
end

