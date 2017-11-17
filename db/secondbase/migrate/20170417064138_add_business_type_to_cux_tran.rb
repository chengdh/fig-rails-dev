#coding: utf-8
class AddBusinessTypeToCuxTran < ActiveRecord::Migration
  def change
    add_column :cux_transaction_headers_all_a,:business_type,:string,limit: 60
  end
end
