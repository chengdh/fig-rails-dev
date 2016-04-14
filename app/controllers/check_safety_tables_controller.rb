#coding: utf-8
#安全月报检查
class CheckSafetyTablesController < SafetyTablesController
  defaults :resource_class => SafetyTable, :collection_name => 'safety_tables', :instance_name => 'safety_table'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => [:index,:search]
  #load_and_authorize_resource :training
  #GET check_meetings/:id/show_check
  #GET check_meetings/:id/show_check.json
  #显示审批界面
  def show_check
    @safety_table = SafetyTable.find(params[:id])
  end
end
