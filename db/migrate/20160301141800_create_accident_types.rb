#coding: utf-8
#工伤类型
class CreateAccidentTypes < ActiveRecord::Migration
  def change
    create_table :accident_types do |t|
      t.string :name,limit: 60,null: false
      t.integer :order_by,default: 1
      t.boolean :is_active,default: true
      t.boolean :is_work_injury,default: false

      t.timestamps null: false
    end
  end
end
