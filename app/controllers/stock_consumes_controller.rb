#coding: utf-8
#易耗品-库存
class StockConsumesController < BaseStocksController
  defaults :resource_class => StockConsume, :collection_name => 'stock_consumes', :instance_name => 'stock_consume'
end

