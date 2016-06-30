#coding: utf-8
class CheckVpnInfosController < VpnInfosController
  defaults :resource_class => VpnInfo, :collection_name => 'vpn_infos', :instance_name => 'vpn_info'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => [:index,:search]
  #load_and_authorize_resource :training
  #GET check_ip_info_headers/:id/show_check
  #GET check_ip_info_headers/:id/show_check.json
  #显示审批界面
  def show_check
    @vpn_info = resource_class.find(params[:id])
  end
end