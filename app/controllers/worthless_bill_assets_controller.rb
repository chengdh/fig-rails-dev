#coding: utf-8
#固定资产-设备报废单
class WorthlessBillAssetsController < InoutBillsController
  defaults :resource_class => WorthlessBillAsset, :collection_name => 'worthless_bill_asset', :instance_name => 'worthless_bill_assets'
end

