#coding: utf-8
class CreateCuxGlJeLines < ActiveRecord::Migration
  def change
    create_table :cux_gl_je_lines_a,id: false do |t|
      t.integer :je_header_id
      t.integer :je_line_num
      t.integer :code_combination_id
      t.string :accounting_flexfield
      t.decimal :entered_dr
      t.decimal :entered_cr
      t.decimal:stat_amount
      t.string :description
      t.string :attribute1
      t.string :attribute8
      t.date :creation_date
      t.date :last_update_date
      t.timestamps null: false
    end
  end
end
