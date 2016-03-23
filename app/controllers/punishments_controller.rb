#coding: utf-8
class PunishmentsController < BaseController
  table :org,:punish_org,:name,:table_date,:check_state_des

  #PATCH /punishments/:id/confirm
  #处罚信息发布
  def confirm
    @punishment = Punishment.find(params[:id])
    if @punishment.update_attributes(check_state: "confirmed",poster: current_user,post_date: Date.today)
      flash[:success] = "信息发布成功!"
      redirect_to @punishment
    else
      flash[:error] = "信息发布失败!"
      redirect_to :back
    end
  end

  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end

  private
  def punishment_params
    params.require(:punishment).permit(:org_id, :user_id, :punish_org_id,:table_date, :name, :note,:marks, :poster_id, :post_date, :punish_date)
  end
end

