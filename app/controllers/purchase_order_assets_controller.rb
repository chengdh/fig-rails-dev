#coding: utf-8
#固定资产-采购单
class PurchaseOrderAssetsController < BasePurchaseOrdersController
  defaults resource_class: PurchaseOrderAsset, collection_name: 'purchase_order_asset', instance_name: 'purchase_order_asset'
end

