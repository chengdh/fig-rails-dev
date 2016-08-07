#coding: utf-8
class CheckCompanyVpnsController < CompanyVpnsController
  defaults :resource_class => CompanyVpn, :collection_name => 'company_vpns', :instance_name => 'company_vpn'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => [:index,:search,:search_lines]
  #load_and_authorize_resource :training
  #GET check_ip_info_headers/:id/show_check
  #GET check_ip_info_headers/:id/show_check.json
  #显示审批界面
  def show_check
    @company_vpn = resource_class.find(params[:id])
  end
end
