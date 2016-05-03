#coding: utf-8
class StockVirtualsController < BaseStocksController
  defaults :resource_class => StockVirtual, :collection_name => 'stock_virtuals', :instance_name => 'stock_virtual'
end

