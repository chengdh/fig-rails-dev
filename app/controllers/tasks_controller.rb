#coding: utf-8
#任务管理
class TasksController < BaseController
  table :org,:task_date,:user,:task_category,:executer,:state_des

  #PUT tasks/:id/deliver
  #PUT tasks/:id/deliver
  #下发
  def deliver
    @task = Task.find(params[:id])
    if @task.update_attributes(state: "deliveried",deliver: current_user,deliver_date: Date.today)
      flash[:success] = "数据下发成功!"
    else
      flash[:success] = "数据下发失败!"
    end
    redirect_to @task
  end

  #PUT tasks/:id/confirm
  #PUT tasks/:id/confirm
  #下发
  def confirm
    @task = Task.find(params[:id])
    if @task.update_attributes(state: "confirmed",confirmer: current_user,confirm_date: Date.today)
      flash[:success] = "任务确认成功!"
    else
      flash[:success] = "任务确认失败!"
    end
    redirect_to @task
  end

  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end

  private
  def task_params
    params.require(:task).permit(:org_id, :user_id, :task_category_id, :task_date, :name, :note, :executer_id, :state)
  end
end

