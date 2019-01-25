#coding: utf-8
#系统功能
class CreateSystemFunctions < ActiveRecord::Migration
  def change
    create_table :system_functions do |t|
      t.string :name,limit: 60,null: false
      t.boolean :is_active,default: true
      t.integer :order_by
      t.references :system_function_group, index: true, foreign_key: true
      t.text :default_action

      t.timestamps null: false
    end
  end
end
