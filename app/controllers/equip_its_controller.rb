#coding: utf-8
class EquipItsController < EquipmentController
  defaults :resource_class => EquipIt, :collection_name => 'equip_its', :instance_name => 'equip_it'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => [:index,:search]
end
