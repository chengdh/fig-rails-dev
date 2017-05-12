#coding: utf-8
class CreatePoHeaders < ActiveRecord::Migration
  def change
    create_table :po_headers_a do |t|
      t.integer :agent_id
      t.string :agent_name
      t.integer :last_updated_by
      t.date :last_update_date
      t.string :segment1
      t.integer :vendor_id
      t.string :vendor_name
      t.integer :vendor_site_id
      t.string :vendor_site_code
      t.string :payment_terms
      t.string :comments
      t.string :wf_item_type
      t.string :wf_item_key
      t.integer :org_id
      t.timestamps null: false
    end
  end
end
