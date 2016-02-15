#coding: utf-8
class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name,null: false,limit: 30
      t.references :warehouse, index: true
      t.string :x,limit: 20,default: '0'
      t.string :y,limit: 20,default: '0'
      t.string :z,limit: 20,default: '0'
      t.integer :order_by,default: 1
      t.boolean :is_active,default: true
      t.text :note

      t.timestamps null: false
    end
  end
end
