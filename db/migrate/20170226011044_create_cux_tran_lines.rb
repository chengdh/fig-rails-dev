#coding: utf-8
class CreateCuxTranLines < ActiveRecord::Migration
  def change
    create_table :cux_transaction_lines_all_a do |t|
      t.integer :require_id
      t.integer :line_number
      t.integer :organization_id
      t.integer :inventory_item_id
      t.string :item_spc
      t.string :uom
      t.string :subinventory
      t.decimal :required_qty,precision: 15,scale: 2
      t.string :project_number
      t.string :task_number
      t.string :apply_number
      t.integer :apply_line_num
      t.decimal :apply_qty,precision: 15,scale: 2

      t.string :item_number
      t.string :item_dec
      t.string :remark
      t.integer :project_id
      t.integer :task_id
      t.string :expense_type
      t.decimal :cost,precision: 15,scale: 2

      t.string :wip_entity_name
      t.integer :operation_seq_num
      t.decimal :canceled_qty,precision: 15,scale: 2


      t.timestamps null: false
    end
  end
end
