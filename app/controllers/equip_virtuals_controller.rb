#coding: utf-8
class EquipVirtualsController < EquipmentController
  defaults :resource_class => EquipVirtual, :collection_name => 'equip_virtuals', :instance_name => 'equip_virtual'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => [:index,:search]
end
