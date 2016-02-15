#coding: utf-8
#仓库类别
class CreateWarehouseTypes < ActiveRecord::Migration
  def change
    create_table :warehouse_types do |t|
      t.string :name,null: false,limit: 30
      t.integer :order_by,default: 1
      t.boolean :is_active,default: true

      t.timestamps null: false
    end
  end
end
