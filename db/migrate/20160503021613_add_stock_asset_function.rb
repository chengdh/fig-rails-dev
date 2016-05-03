#coding: utf-8
class AddStockAssetFunction < ActiveRecord::Migration
  def change
    group_name = "信息-固定资产管理"
    sf_name = "固定资产-库存统计"
    subject = "StockAsset"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'stock_assets_path',
      function: {
        read: {name: "查看"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
