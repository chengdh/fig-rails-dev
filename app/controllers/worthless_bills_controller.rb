#coding: utf-8
#设备报废单
class WorthlessBillsController < InoutBillsController
  defaults :resource_class => WorthlessBill, :collection_name => 'worthless_bill', :instance_name => 'worthless_bills'
end

