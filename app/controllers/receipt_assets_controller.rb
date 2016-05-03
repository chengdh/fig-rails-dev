#coding: utf-8
class ReceiptAssetsController < InoutBillsController
  defaults resource_class: ReceiptAsset, collection_name: 'receipt_assets', instance_name: 'receipt_asset'
end

