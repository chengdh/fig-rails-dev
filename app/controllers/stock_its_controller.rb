#coding: utf-8
#库存管理-信息设备
class StockItsController < BaseStocksController
  defaults :resource_class => StockIt, :collection_name => 'stock_its', :instance_name => 'stock_it'
  protected
  def collection
    @q= end_of_association_chain.ransack(params[:q])
    set_collection_ivar(@q.result)
    # set_collection_ivar(@q.result.paginate(:page => params[:page]))
  end
end
