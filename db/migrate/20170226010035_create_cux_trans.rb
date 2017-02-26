#coding: utf-8
class CreateCuxTrans < ActiveRecord::Migration
  def change
    create_table :cux_transaction_headers_all_a do |t|
      t.string :require_number
      t.string :require_deparment
      t.string :require_status
      t.string :require_person
      t.integer :require_person_id
      t.datetime :require_date
      t.datetime :last_update_date
      t.string :last_update_by
      t.datetime :creation_date
      t.integer :created_by
      t.integer :last_update_login
      t.string :require_status_code
      t.string :require_type
      t.integer :require_type_id
      t.integer :wip_entity_id
      t.string :categorie
      t.text :remark
      t.string :trans_deparment
      t.string :wf_itemkey
      t.decimal :bugdet_balance,precision: 15,scale: 2
      t.decimal :header_bugdet,precision: 15,scale: 2
      t.decimal :bugdet_demand_total,precision: 15,scale: 2
      t.decimal :bugdet_total,precision: 15,scale: 2
      t.integer :project_id
      t.string :name
      t.string :segment1
      t.string :project_type

      t.timestamps null: false
    end
  end
end
