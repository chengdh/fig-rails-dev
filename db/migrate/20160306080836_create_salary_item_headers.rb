#coding: utf-8
#工资项目表头
class CreateSalaryItemHeaders < ActiveRecord::Migration
  def change
    create_table :salary_item_headers do |t|
      t.references :org, index: true
      t.string :name,limit: 60,null: false
      t.integer :order_by,default: 1
      t.boolean :is_active,default: true
      t.text :note

      t.timestamps null: false
    end
  end
end
