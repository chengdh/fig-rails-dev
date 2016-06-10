#coding: utf-8
#县局劳务-工资表
class SalaryTableXianNonStaffsController < SalaryTablesController
  defaults :resource_class => SalaryTableXianNonStaff, :collection_name => 'salary_table_xian_non_staffs', :instance_name => 'salary_table_xian_non_staff'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => [:index,:search]
end

