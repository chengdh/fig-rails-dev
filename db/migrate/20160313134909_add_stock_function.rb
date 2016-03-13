#coding: utf-8
class AddStockFunction < ActiveRecord::Migration
  def change
    group_name = "设备管理"
    sf_name = "库存统计"
    subject = "Stock"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'stocks_path',
      function: {
        read: {name: "查看"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end

end
