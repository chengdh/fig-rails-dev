#coding: utf-8
#固定资产-移库单
class MoveBillAssetsController < InoutBillsController
  defaults :resource_class => MoveBillAsset, :collection_name => 'move_bill_assets', :instance_name => 'move_bill_asset'
end

