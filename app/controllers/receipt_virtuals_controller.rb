#coding: utf-8
#无形资产入库
class ReceiptVirtualsController < InoutBillsController
  defaults resource_class: ReceiptVirtual, collection_name: 'receipt_virtuals', instance_name: 'receipt_virtuals'
end

