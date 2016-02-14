#coding: utf-8
#设备类别
class CreateEquipmentCategories < ActiveRecord::Migration
  def change
    create_table :equipment_categories do |t|
      t.string :name,null: false,index: true,limit: 60
      t.integer :order_by,default: 1
      t.boolean :is_active,default: true
      t.references :org, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
