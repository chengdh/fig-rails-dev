#coding: utf-8
#库存管理-信息设备
class StockAssetsController < BaseStocksController
  defaults :resource_class => StockAsset, :collection_name => 'stock_assets', :instance_name => 'stock_asset'
end

