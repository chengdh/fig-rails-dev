#coding: utf-8
#县局内退-工资表
class SalaryTableXianRetiredsController < SalaryTablesController
  defaults :resource_class => SalaryTableXianRetired, :collection_name => 'salary_table_xian_retireds', :instance_name => 'salary_table_xian_retired'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => [:index,:search]
end
