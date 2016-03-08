#coding: utf-8
#采购入库单
class ReceiptsController < InoutBillsController
  defaults resource_class: Receipt, collection_name: 'receipts', instance_name: 'receipt'
end

