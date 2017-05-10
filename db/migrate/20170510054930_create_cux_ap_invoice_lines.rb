#coding: utf-8
class CreateCuxApInvoiceLines < ActiveRecord::Migration
  def change
    create_table :cux_ap_invoice_lines_a,id: false do |t|
      t.integer :org_id
      t.integer :invoice_id
      t.integer :line_number
      t.string :line_type_lookup_code
      t.string :line_type
      t.string :description
      t.integer :default_dist_ccid
      t.string :default_dist_cccode
      t.string :default_dist_ccdesc
      t.integer :po_header_id
      t.string :po_seg
      t.decimal :quantity_invoiced,precision: 15,scale: 2
      t.string :unit_meas_lookup_code

      t.decimal :unit_price,precision: 15,scale: 2
      t.decimal :amount,precision: 15,scale: 2
      t.date :creation_date
      t.date :last_update_date

      t.timestamps null: false
    end
  end
end
