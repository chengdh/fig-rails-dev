#coding: utf-8
#仓库管理
class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.string :name,null: false,limit: 30
      t.references :org, index: true,null: false
      t.references :warehouse_type, index: true
      t.integer :default_location_id
      t.string :address,limit: 60
      t.string :leader,limit: 30
      t.integer :order_by,default: 1
      t.boolean :is_active,default: true
      t.string :phone,limit: 30
      t.decimal :area,precision: 15,scale: 2
      t.decimal :volume,precision: 15,scale: 2
      t.text :note

      t.timestamps null: false
    end
  end
end
