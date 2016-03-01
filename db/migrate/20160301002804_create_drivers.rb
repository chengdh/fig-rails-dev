#coding: utf-8
class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.references :org, index: true,null: false
      t.string :name,null: false,limit: 60
      t.references :vehicle, index: true,null: false
      t.string :driver_no,limit: 30
      t.string :id_no,limit: 30
      t.string :mobile,limit: 20
      t.date :next_check_date
      t.boolean :is_active,default: true
      t.text :note

      t.timestamps null: false
    end
  end
end
