#coding: utf-8
class AddRefPartnerToBasePurchaseOrder < ActiveRecord::Migration
  def change
    add_column :base_purchase_orders, :ref_partner, :string,limit: 60
  end
end
