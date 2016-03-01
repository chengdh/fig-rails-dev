#coding: utf-8
class CreateSpecWarehouses < ActiveRecord::Migration
  def change
    create_table :spec_warehouses do |t|
      t.string :warehouse_type,null: false,limit: 20
      t.string :name,limit: 60,null: false
      t.references :org, index: true, null: false
      t.string :location,limit: 60
      t.date :build_date
      t.decimal :building_area,precision: 15,scale: 2
      t.integer :room_count,default: 1
      t.integer :fire_level,default: 1
      t.decimal :max_volume,precision: 15,scale: 2,default: 10000
      t.decimal :act_volume,precision: 15,scale: 2,default:  10000
      t.boolean :is_camera_moniter,default: true
      t.boolean :is_fire_fighting_alarm_system,default: true
      t.boolean :is_auto_fire_fighting_system,default: true
      t.boolean :is_fire_hydrant_system,default: true
      t.boolean :is_lightning_protector,default: true
      t.boolean :is_active,default: true
      t.text :note

      t.timestamps null: false
    end
  end
end
