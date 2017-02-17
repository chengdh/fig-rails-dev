#coding: utf-8
class CreateCuxDemandPlatformLinesAs < ActiveRecord::Migration
  def change
    create_table :cux_demand_platform_lines_as do |t|
      t.integer :apply_id
      t.string :line_type,limit: 30
      t.string :apply_number,limit: 30
      t.string :item_number,limit: 30
      t.integer :item_id
      t.string :item_descripton,limit: 60
      t.string :item_spec,limit: 60
      t.decimal :item_price,default: 0,precision: 15,scale: 2
      t.decimal :demand_quantiry,default: 0,precision: 15,scale: 2
      t.decimal :line_budget,default: 0,precision: 15,scale: 2

      t.timestamps null: false
    end
  end
end
