#coding: utf-8
#工资项目
class CreateSalaryItems < ActiveRecord::Migration
  def change
    create_table :salary_items do |t|
      t.references :salary_item_header,null: false
      t.string :name,null: false,limit: 30
      t.string :code,null: false
      t.integer :order_by,default: 1
      t.string :item_type,limit: 30,default: "plus_item"
      t.boolean :is_active,default: true
      t.boolean :is_calculate,default: false
      t.string :formula,limit: 300

      t.timestamps null: false
    end
  end
end
