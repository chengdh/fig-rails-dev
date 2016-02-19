#coding: utf-8
class CreateInoutLines < ActiveRecord::Migration
  def change
    create_table :inout_lines do |t|
      t.references :equipment,null: false
      t.references :inout_bill, index: true,null: false
      t.integer :f_location_id,null: false
      t.integer :t_location_id,null: false
      t.date :move_date
      t.string :state,limit: 60
      t.integer :qty,default: 1
      t.decimal :price,precision: 15,scale: 2

      t.timestamps null: false
    end
  end
end
