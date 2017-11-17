#coding: utf-8
class CreateCuxFaTransferLines < ActiveRecord::Migration
  def change
    create_table :cux_fa_transfer_lines_a,id: false do |t|
      t.integer :header_id
      t.integer :line_id
      t.integer :asset_id
      t.string :asset_name
      t.string :assigned_full_name
      t.string :location_from
      t.string :used_department_disp
      t.string :fa_category
      t.string :manager_department_disp
      t.date :creation_date
      t.date :last_update_date
      t.timestamps null: false
    end
  end
end
