#coding: utf-8
#创建任务分类
class CreateTaskCategories < ActiveRecord::Migration
  def change
    create_table :task_categories do |t|
      t.string :name,null: false,limit: 60
      t.integer :order_by,default: 1
      t.boolean :is_active,default: true
      t.text :note

      t.timestamps null: false
    end
  end
end
