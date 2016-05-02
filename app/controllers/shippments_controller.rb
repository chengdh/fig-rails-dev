#coding: utf-8
#出库单
class ShippmentsController < InoutBillsController
  defaults :resource_class => Shippment, :collection_name => 'shippments', :instance_name => 'shippment'
end
