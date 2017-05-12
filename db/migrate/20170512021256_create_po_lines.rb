#coding: utf-8
class CreatePoLines < ActiveRecord::Migration
  def change
    create_table :po_lines_a do |t|
      t.date :last_update_date
      t.integer :last_updated_by
      t.date :creation_date
      t.integer :created_by
      t.integer :po_header_id
      t.integer :line_type_id
      t.string :line_type
      t.integer :line_num
      t.integer :item_id
      t.string :segment1
      t.string :description
      t.string :unit_meas_lookup_code
      t.decimal :unit_price,precision: 15,scale: 2
      t.decimal :quantity,precision: 15,scale: 2
      t.string :attribute1
      t.string :attribute2
      t.string :line_reference_num
      t.integer :org_id

      t.timestamps null: false
    end
  end
end
