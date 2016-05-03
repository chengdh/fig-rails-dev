#coding: utf-8
#易耗品-采购订单
class PurchaseOrderConsumesController < BasePurchaseOrdersController
  defaults resource_class: PurchaseOrderConsume, collection_name: 'purchase_order_consumes', instance_name: 'purchase_order_consume'
end

