#coding: utf-8
#出库单-固定资产
class ShippmentAssetsController < InoutBillsController
  defaults :resource_class => ShippmentAsset, :collection_name => 'shippment_assets', :instance_name => 'shippment_asset'
end
