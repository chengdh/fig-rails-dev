#coding: utf-8
#创建计量单位
class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name,null: false,limit: 30
      t.integer :order_by,default: 1
      t.boolean :is_active,default: true

      t.timestamps null: false
    end
  end
end
