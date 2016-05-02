#coding: utf-8
#领用单
class ReceiveBillsController < InoutBillsController
  defaults resource_class: ReceiveBill, collection_name: 'receive_bills', instance_name: 'receive_bill'
end

