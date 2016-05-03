#coding: utf-8
class AddCodeToWarehouseType < ActiveRecord::Migration
  def change
    add_column :warehouse_types, :code, :string,limit: 30
  end
end
