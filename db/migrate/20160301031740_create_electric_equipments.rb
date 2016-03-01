#coding: utf-8
#电气设备管理
class CreateElectricEquipments < ActiveRecord::Migration
  def change
    create_table :electric_equipments do |t|
      t.references :org, index: true, null: false
      t.decimal :area
      t.integer :fire_level
      t.date :build_date
      t.integer :manage_org_id, index: true
      t.integer :qty,default: 1
      t.date :buy_date
      t.integer :power
      t.decimal :volume,precision: 15,scale: 2,default: 10
      t.string :work_type
      t.date :last_check_date
      t.boolean :is_active,default: true
      t.string :type,limit: 60,null: false
      t.text :note

      t.timestamps null: false
    end
  end
end
