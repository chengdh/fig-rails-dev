#coding: utf-8
class DangerOrgHiddenDangersController < HiddenDangersController
  defaults :resource_class => HiddenDanger, :collection_name => 'hidden_dangers', :instance_name => 'hidden_danger'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => :index
  #load_and_authorize_resource :training
  table :org,:danger_org,:name,:danger_date,:fix_period_des,:fixed_state_des,:review_date,:review_state_des
  #PATCH danger_org_hidden_dangers/:id/fix
  #PATCH danger_org_hidden_dangers/:id/fix.json
  def fix
    @hidden_danger = HiddenDanger.find(params[:id])
    if @hidden_danger.update_attributes(fixed_state: "fixed",fixer: current_user,fixed_date: Date.today)
      flash[:success] = "数据更新成功!"
    else
      flash[:success] = "数据更新失败!"
    end
    redirect_to danger_org_hidden_danger_path(@hidden_danger)
  end
  protected
  def collection
    @q= end_of_association_chain.where(danger_org_id: current_ability_org_ids,fixed_state: ["deliveried","fixed","processing"]).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end


end
