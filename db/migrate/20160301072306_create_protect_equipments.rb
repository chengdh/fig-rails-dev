#coding: utf-8
class CreateProtectEquipments < ActiveRecord::Migration
  def change
    create_table :protect_equipments do |t|
      t.references :protect_equipment_category, index: true,null: false
      t.references :org, index: true,null: false
      t.string :name,null: false,limit: 60
      t.integer :deliver_org_id
      t.string :post,limit: 30
      t.integer :qty,default: 10
      t.references :unit, index: true
      t.integer :save_days
      t.integer :maintain_days
      t.boolean :is_active,default: true
      t.text :note

      t.timestamps null: false
    end
  end
end
