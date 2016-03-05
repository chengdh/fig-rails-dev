#coding: utf-8
#隐患整改
class HiddenDangersController < BaseController
  table :org,:danger_org,:name,:danger_date,:fix_period_des,:fixed_state_des,:review_date,:review_state_des

  #PUT hidden_dangers/:id/deliver
  #PUT hidden_dangers/:id/deliver
  #下发
  def deliver
    @hidden_danger = HiddenDanger.find(params[:id])
    if @hidden_danger.update_attributes(fixed_state: "deliveried",deliver: current_user,deliver_date: Date.today)
      flash[:success] = "数据下发成功!"
    else
      flash[:success] = "数据下发失败!"
    end
    redirect_to @hidden_danger
  end
  #PUT hidden_dangers/:id/review_ok
  #PUT hidden_dangers/:id/review.json
  #复查
  def review_ok
    @hidden_danger = HiddenDanger.find(params[:id])
    if @hidden_danger.review(true,reviewer_id: current_user.id)
      flash[:success] = "隐患整改信息复查成功!"
    else
      flash[:success] = "隐患整改信息复查失败!"
    end
    redirect_to @hidden_danger
  end
  #PUT hidden_dangers/:id/review_reject
  #PUT hidden_dangers/:id/review_reject.json
  #复查
  def review_reject
    @hidden_danger = HiddenDanger.find(params[:id])
    if @hidden_danger.review(false,reviewer_id: current_user.id)
      flash[:success] = "隐患整改信息复查成功!"
    else
      flash[:success] = "隐患整改信息复查失败!"
    end
    redirect_to @hidden_danger
  end

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

