#coding: utf-8
#应急演练审核
class CheckPlanbDocsController < PlanbDocsController
  defaults :resource_class => PlanbDoc, :collection_name => 'planb_docs', :instance_name => 'planb_doc'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => :index
  #load_and_authorize_resource :training
  table :org,:name,:plan_date,:plan_length,:plan_type_des,:check_state_des
  #GET check_trainings/:id/show_check
  #GET check_trainings/:id/show_check.json
  #显示审批界面
  def show_check
    @planb_doc = PlanbDoc.find(params[:id])
  end
end
