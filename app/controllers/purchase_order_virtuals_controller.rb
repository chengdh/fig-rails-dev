#coding: utf-8
#无形资产-采购订单
class PurchaseOrderVirtualsController < BasePurchaseOrdersController
  defaults resource_class: PurchaseOrderVirtual, collection_name: 'purchase_order_virtuals', instance_name: 'purchase_order_virtual'
end

