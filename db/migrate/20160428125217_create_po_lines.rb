#coding: utf-8
class CreatePoLines < ActiveRecord::Migration
  def change
    create_table :po_lines do |t|
      t.references :equipment, index: true
      t.references :base_purchase_order, index: true
      t.string :state,limit: 60
      t.integer :qty,default: 1
      t.decimal :price,default: 0.0,precision: 15,scale: 2
      t.string :brand,limit: 60
      t.string :model,limit: 60

      t.timestamps null: false
    end
  end
end
