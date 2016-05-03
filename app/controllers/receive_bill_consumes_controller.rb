#coding: utf-8
#易耗品-领用单
class ReceiveBillConsumesController < InoutBillsController
  defaults resource_class: ReceiveBillConsume, collection_name: 'receive_bill_consumes', instance_name: 'receive_bill_consume'
end

