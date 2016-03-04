#coding: utf-8
#设备资料
class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name,null: false,limit: 30
      t.references :equipment_category, index: true,null: false
      t.references :unit, index: true,null: false
      t.decimal :purchase_price,precision: 10,scale: 2
      #购买日期
      t.datetime :purchase_date
      t.string :factory_name,limit: 60
      #型号
      t.string :model,limit: 60
      #保修时间
      t.integer :guarantee_days,default: 180
      t.integer :order_by,default: 1
      t.boolean :is_active,default: true

      t.timestamps null: false
    end
  end
end
