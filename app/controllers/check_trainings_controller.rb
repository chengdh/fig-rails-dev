#coding: utf-8
#教育培训信息审批
class CheckTrainingsController < TrainingsController
  defaults :resource_class => Training, :collection_name => 'trainings', :instance_name => 'training'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => [:index,:search]
  #load_and_authorize_resource :training
  table :org,:name,:training_date,:teachers,:training_length,:check_state_des

  #GET check_trainings/:id/show_check
  #GET check_trainings/:id/show_check.json
  #显示审批界面
  def show_check
    @training = Training.find(params[:id])
  end

  #PATCH check_trainings/:id/check
  #审批
  def check
    @training = Training.find(params[:id])
    if @training.update_attributes(training_params)
      flash[:success] = "数据保存成功."
      redirect_to resource
    else
      flash[:error] = "数据保存失败."
      redirect_to :back
    end
  end

  private
  def training_params
    params.require(:training).permit(:org_id, :table_date, :user_id, :name, :training_date, :teachers,
                                     :training_length, :join_persons, :join_count, :training_content,
                                     :is_assess, :assess_type, :qualified_rate, :check_state,
                                     :check_opinion, :checker_id)
  end
end
