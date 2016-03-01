#coding: utf-8
class CreateSpecEquipments < ActiveRecord::Migration
  def change
    create_table :spec_equipments do |t|
      t.string :equip_type,null: false,limit: 20
      t.references :org, index: true, null: false
      t.date :equip_date
      t.string :vendor,limit: 60
      t.string :model,limit: 50
      t.string :location,limit: 60
      t.decimal :ton,precision: 10,scale: 2,default: 1
      t.decimal :volume,precision: 10,scale: 2,default: 1
      t.string :usage,limit: 60
      t.date :last_check_date
      t.text :note
      t.boolean :is_active,default: true

      t.timestamps null: false
    end
  end
end
