#coding: utf-8
class CreateProtectEquipmentCategories < ActiveRecord::Migration
  def change
    create_table :protect_equipment_categories do |t|
      t.string :name,null: false,limit: 60
      t.integer :order_by,default: 1
      t.boolean :is_active,default: true

      t.timestamps null: false
    end
  end
end
