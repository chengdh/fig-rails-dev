#coding: utf-8
#市局内退-工资表
class SalaryTableShiNonStaffsController < SalaryTablesController 
  defaults :resource_class => SalaryTableShiNonStaff, :collection_name => 'salary_table_shi_non_staff', :instance_name => 'salary_table_shi_non_staff'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => [:index,:search]
end
