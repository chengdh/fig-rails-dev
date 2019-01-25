#coding: utf-8
class CreateOrgs < ActiveRecord::Migration
  def change
    create_table :orgs do |t|
      t.string :name,null: false,limit: 60
      t.integer :parent_id
      t.string :address,limit: 60
      t.string :org_type,limit: 10
      t.boolean :is_active,default: true
      t.integer :order_by,default: 1
      t.text :note

      t.timestamps null: false
    end
  end
end
