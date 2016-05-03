#coding: utf-8
#设备-采购单
class PurchaseOrderItsController < BasePurchaseOrdersController
  defaults resource_class: PurchaseOrderIt, collection_name: 'purchase_order_its', instance_name: 'purchase_order_it'
end

