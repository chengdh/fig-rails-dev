#coding: utf-8
class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.references :org, index: true, null: false
      t.string :name,null: false,limit: 60
      t.string :location,limit: 60
      t.date :build_date
      t.decimal :building_area,precision: 15,scale: 2
      t.boolean :is_rent,default: false
      t.string :usage,limit: 60
      t.boolean :have_safe_contract,default: true
      t.date :rent_to
      t.boolean :is_active,default: true
      t.text :note

      t.timestamps null: false
    end
  end
end
