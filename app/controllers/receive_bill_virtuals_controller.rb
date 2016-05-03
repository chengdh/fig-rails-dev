#coding: utf-8
#无形资产-领用单
class ReceiveBillVirtualsController < InoutBillsController
  defaults resource_class: ReceiveBillVirtual, collection_name: 'receive_bill_virtuals', instance_name: 'receive_bill_virtual'
end
