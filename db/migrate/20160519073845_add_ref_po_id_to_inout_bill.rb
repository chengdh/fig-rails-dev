#coding: utf-8
#给inout_bill添加关联的采购订单字段
class AddRefPoIdToInoutBill < ActiveRecord::Migration
  def change
    add_column :inout_bills, :ref_po_id, :integer
  end
end
