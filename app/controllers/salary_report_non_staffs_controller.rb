#coding: utf-8
class SalaryReportNonStaffsController < BaseSalaryReportsController
  defaults :resource_class => SalaryReportNonStaff,
    :collection_name => 'salary_report_non_staffs',
    :instance_name => 'salary_report_non_staff'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => [:index,:search]
end

