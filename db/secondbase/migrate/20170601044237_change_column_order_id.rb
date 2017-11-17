#coding: utf-8
class ChangeColumnOrderId < ActiveRecord::Migration
  def change
    rename_column :maximo_msgs,:order_id,:orderid
  end
end
