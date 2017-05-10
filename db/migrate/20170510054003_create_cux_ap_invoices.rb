#coding: utf-8
class CreateCuxApInvoices < ActiveRecord::Migration
  def change
    create_table :cux_ap_invoices_a do |t|
      t.integer :org_id
      t.string :invoice_type_lookup_code
      t.string :invoice_type
      t.integer :vendor_id
      t.string :vendor_name
      t.integer :vendor_site_id
      t.string :vendor_site_code
      t.string :invoice_num
      t.date :invoice_date
      t.date :gl_date
      t.decimal :invoice_amount,precision: 15,scale: 2
      t.string :description
      t.integer :accts_pay_code_combination_id
      t.string :accts_pay_code_seg
      t.string :accts_pay_code_desc
      t.string :attribute2
      t.string :attribute3
      t.string :attribute3_dsp
      t.string :attribute4
      t.string :attribute4_dsp
      t.string :attribute7
      t.string :attribute8
      t.string :attribute9
      t.string :attribute10
      t.string :attribute11
      t.string :attribute12
      t.string :attribute13
      t.string :attribute14
      t.string :attribute15
      t.string :wfapproval_status
      t.string :wfapproval_status_dsp
      t.string :posting_flag
      t.string :approval_status_lookup_code



      t.timestamps null: false
    end
  end
end
