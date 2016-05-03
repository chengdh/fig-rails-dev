#coding: utf-8
#固定资产-领用单
class ReceiveBillAssetsController < InoutBillsController
  defaults :resource_class => ReceiveBillAsset, :collection_name => 'receive_bill_asset', :instance_name => 'receive_bill_assets'
end
