#coding: utf-8
#易耗品-入库单
class ReceiptConsumesController < InoutBillsController
  defaults resource_class: ReceiptConsume, collection_name: 'receipt_consumes', instance_name: 'receipt_consume'
end
