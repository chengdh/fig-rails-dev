#coding: utf-8
class ChangeStockFunction < ActiveRecord::Migration
  def change
    sf_name = "库存统计"
    sf = SystemFunction.find_by(name: sf_name)
    subject = "StockIt"
    sf_hash = {
      name: sf_name,
      subject: subject,
      default_action: 'stock_its_path',
      function: {
        read: {name: "查看"}
      }
    }
    sf.update_by_hash(sf_hash) if sf.present?
 
  end
end
