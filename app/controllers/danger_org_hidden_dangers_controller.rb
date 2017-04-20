#coding: utf-8
class DangerOrgHiddenDangersController < HiddenDangersController
  defaults :resource_class => HiddenDanger, :collection_name => 'hidden_dangers', :instance_name => 'hidden_danger'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => [:index,:search,:export_excel,:export_excel_single]
  #load_and_authorize_resource :training
  table :org,:danger_org,:bill_no,:name,:categ_des,:deliver_date,:fix_period_des,:expire_fix_date,:fixed_state_des,:review_state_des

  #GET danger_org_hidden_dangers/:id/show_fix
  #显示整改界面
  def show_fix ; end
  #PATCH danger_org_hidden_dangers/:id/fix
  #PATCH danger_org_hidden_dangers/:id/fix.json
  def fix
    @hidden_danger = HiddenDanger.find(params[:id])
    #判断是否超期
    if @hidden_danger.fix(current_user,hidden_danger_params)
      flash[:success] = "数据更新成功!"
    else
      flash[:success] = "数据更新失败!"
    end
    redirect_to danger_org_hidden_danger_path(@hidden_danger)
  end

  #GET danger_org_hidden_dangers/:id/show_postponement
  #GET danger_org_hidden_dangers/:id/show_postponement.json
  #显示延期界面
  def show_postponement ; end
  #PATCH danger_org_hidden_dangers/:id/postponement
  #PATCH danger_org_hidden_dangers/:id/postponement.json
  #延期
  def postponement
    @hidden_danger = HiddenDanger.find(params[:id])
    if @hidden_danger.postponement(current_user,hidden_danger_params)
      flash[:success] = "延期操作成功!"
    else
      flash[:success] = "延期操作失败!"
    end
    redirect_to danger_org_hidden_danger_path(@hidden_danger)
  end
  protected
  def collection
    @q= end_of_association_chain.where(danger_org_id: current_user.current_org.id,fixed_state: ["deliveried","fixed","processing"]).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end
  private

  def hidden_danger_params
    params.require(:hidden_danger).permit(:org_id, :danger_org_id, :parent_id, :name, :danger_date,
                                          :fix_period, :fixed_state, :fixed_date, :fixer_id, :review_date,
                                          :review_state, :reviewer_id,:checker_name,:check_date, :note,:fixed_note,:review_note,
                                          :photo_1,:photo_2,:photo_3,:photo_4,:photo_5,:photo_6,
                                          :fixed_photo_1,:fixed_photo_2,:fixed_photo_3,:fixed_photo_4,:fixed_photo_5,:fixed_photo_6,
                                          :postponement_days,:postponement_note)
  end
end
