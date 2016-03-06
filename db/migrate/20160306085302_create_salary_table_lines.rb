#coding: utf-8
class CreateSalaryTableLines < ActiveRecord::Migration
  def change
    create_table :salary_table_lines do |t|
      t.references :salary_table,null: false,index: true
      t.references :employee, index: true, foreign_key: true
      t.timestamps null: false
    end
    (1..40).each do |i|
      add_column :salary_table_lines,"pay_item_#{i}",:decimal,precision: 15,scale: 2,default: 0
    end
    (1..40).each do |i|
      add_column :salary_table_lines,"deduct_item_#{i}",:decimal,precision: 15,scale: 2,default: 0
    end
  end
end
