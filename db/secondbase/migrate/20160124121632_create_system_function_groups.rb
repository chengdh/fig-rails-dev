#coding: utf-8
#功能分组
class CreateSystemFunctionGroups < ActiveRecord::Migration
  def change
    create_table :system_function_groups do |t|
      t.string :name,limit: 60,null: false
      t.boolean :is_active,default: true
      t.integer :order_by
      t.text :note

      t.timestamps null: false
    end
  end
end
