#coding: utf-8
#移库单
class MoveBillsController < InoutBillsController
  defaults :resource_class => MoveBill, :collection_name => 'move_bills', :instance_name => 'move_bill'
end
