#coding: utf-8
#领导干部薪酬发放统计台帐
class SalaryReportLeadersController < BaseSalaryReportsController
  defaults :resource_class => SalaryReportLeader, :collection_name => 'salary_report_leaders', :instance_name => 'salary_report_leader'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => [:index,:search]
end
