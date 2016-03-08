#coding: utf-8
#设备维修单
class RepairBillsController < InoutBillsController
  defaults :resource_class => RepairBill, :collection_name => 'repair_bills', :instance_name => 'repair_bill'
end

