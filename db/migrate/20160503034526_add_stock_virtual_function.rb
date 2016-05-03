#coding: utf-8
class AddStockVirtualFunction < ActiveRecord::Migration
  def change
    group_name = "信息-无形资产管理"
    sf_name = "无形资产-库存统计"
    subject = "StockVirtual"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'stock_virtuals_path',
      function: {
        read: {name: "查看"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
