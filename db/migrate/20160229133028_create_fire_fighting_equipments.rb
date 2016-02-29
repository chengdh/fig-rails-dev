#coding: utf-8
#消防设施
class CreateFireFightingEquipments < ActiveRecord::Migration
  def change
    create_table :fire_fighting_equipments do |t|
      t.references :org, index: true,null: false
      t.string :name,null: false,limit: 60
      t.string :model,limit: 60
      t.string :location,limit: 6
      t.integer :qty,default: 1
      t.references :unit
      t.date :out_factory_date
      t.integer :use_year
      t.date :valid_date
      t.date :last_upkeep_date
      t.text :note
      t.references :user, index: true
      t.string :duty_person,limit: 30
      t.boolean :is_active,default: true
      t.integer :order_by

      t.timestamps null: false
    end
  end
end
