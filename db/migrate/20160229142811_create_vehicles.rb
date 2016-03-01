#coding: utf-8
#交通工具
class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.references :org,null: false
      t.string :vehicle_no,null: false,limit: 20
      t.string :model,limit: 60
      t.string :register_no,null: false,limit: 30
      t.string :license_no,null: false,limit: 40
      t.date :buy_date
      t.date :expire_date
      t.date :last_check_date
      t.boolean :is_active,default: true
      t.text :note

      t.timestamps null: false
    end
  end
end
