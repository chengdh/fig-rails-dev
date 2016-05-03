#coding: utf-8
#固定资产-维修单
class RepairBillAssetsController < InoutBillsController
  defaults :resource_class => RepairBillAsset, :collection_name => 'repair_bill_assets', :instance_name => 'repair_bill_asset'
end

