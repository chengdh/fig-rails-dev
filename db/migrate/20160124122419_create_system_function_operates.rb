#coding: utf-8
#功能操作
class CreateSystemFunctionOperates < ActiveRecord::Migration
  def change
    create_table :system_function_operates do |t|
      t.string :name,null: false,limit: 60
      t.references :system_function, index: true, foreign_key: true
      t.text :function_obj
      t.boolean :is_active,default: true
      t.integer :order_by

      t.timestamps null: false
    end
  end
end
