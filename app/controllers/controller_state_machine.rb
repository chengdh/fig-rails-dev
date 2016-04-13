#coding: utf-8
module ControllerStateMachine
  #PATCH check_trainings/:id/check
  #审批
  def check
    model = resource_class.find(params[:id])
    set_resource_ivar(model)
    if model.check(send("#{resource_class.model_name.singular}_params".to_sym))
      flash[:success] = "数据保存成功."
      redirect_to resource
    else
      flash[:error] = "数据保存失败."
      redirect_to :back
    end
  end
  #PATCH accident_headers/:id/submit
  #提交
  def submit
    model = resource_class.find(params[:id])
    set_resource_ivar(model)
    if model.submit(submitter_id: current_user.id)
      flash[:success] = "数据已正常提交!"
      redirect_to resource
    else
      flash[:error] = "数据提交失败!"
      redirect_to :back
    end
  end
end
