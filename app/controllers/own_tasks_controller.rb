#coding: utf-8
#个人任务
class OwnTasksController < TasksController
  defaults :resource_class => Task, :collection_name => 'tasks', :instance_name => 'task'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => [:index,:search]
  #load_and_authorize_resource :training
  table :org,:task_date,:user,:task_category,:executer,:state_des
  #GET tasks/:id/show_line
  #GET tasks/:id/show_line.json
  #显示任务反馈表单
  def show_line
    @task = Task.find(params[:id])
  end

  #PATCH tasks/:id/save_line
  #PATCH tasks/:id/save_line
  #保存反馈信息
  def save_line
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "反馈信息保存成功!"
      redirect_to own_task_path(@task)
    else
      flash[:err] = "反馈信息保存失败!"
      render :back
    end

  end
  #PATCH own_tasks/:id/finish
  #PATCH own_tasks/:id/finish
  #完成反馈信息
  def finish
    @task = Task.find(params[:id])
    if @task.update_attributes(state: "finished",finish_date: Date.today,finisher: current_user)
      flash[:success] = "任务已完成!"
      redirect_to own_task_path(@task)
    else
      flash[:err] = "保存任务完成状态失败!"
      render :back
    end
  end

  protected
  def collection
    @q= end_of_association_chain.where(executer_id: current_user.id).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end

  private
  def task_params
    params.require(:task).permit(:org_id, :user_id, :task_category_id, :task_date, :name, :note, :executer_id, :state,task_lines_attributes: [:id,:note,:line_date,:user_id])
  end

end
