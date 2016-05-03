#coding: utf-8
class AddStockConsumeFunction < ActiveRecord::Migration
  def change
    group_name = "信息-易耗品管理"
    sf_name = "易耗品-库存统计"
    subject = "StockConsume"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'stock_consumes_path',
      function: {
        read: {name: "查看"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
