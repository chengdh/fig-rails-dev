#coding: utf-8
#应急预案
class CreatePlanbDocs < ActiveRecord::Migration
  def change
    create_table :planb_docs do |t|
      t.references :org, index: true,null: false
      t.date :table_date
      t.references :user, index: true,null: false
      t.string :name,null: false,limit: 60
      t.date :plan_date,null: false
      t.integer :plan_length,default: 10,null: false
      t.string :plan_type,null: false,limit: 30
      t.string :join_persons,null: false,limit: 100
      t.integer :join_count,null: false,default: 20
      t.text :plan_content,null: false
      t.text :plan_process,null: false
      t.string :document_name,null: false,limit: 60
      t.date :audit_date,null: false
      t.string :audit_persons,null: false,limit: 60
      t.boolean :audit_item_1_state,null: false,default: true
      t.boolean :audit_item_2_state,null: false,default: true

      t.boolean :audit_item_3_state,null: false,default: true

      t.boolean :audit_item_3_state,null: false,default: true

      t.boolean :audit_item_4_state,null: false,default: true

      t.boolean :audit_item_5_state,null: false,default: true

      t.boolean :audit_item_6_state,null: false,default: true

      t.boolean :audit_item_7_state,null: false,default: true

      t.string :audit_item_1_fix,limit: 60
      t.string :audit_item_2_fix,limit: 60

      t.string :audit_item_3_fix,limit: 60

      t.string :audit_item_4_fix,limit: 60

      t.string :audit_item_5_fix,limit: 60

      t.string :audit_item_6_fix,limit: 60

      t.string :audit_item_7_fix,limit: 60
      t.text :note,null: false
      t.string :check_leader,null: false,limit: 60
      t.string :note_taker,null: false,limit: 60
      t.integer :checker_id
      t.string :check_state,null: false,default: "draft"
      t.string :check_opinion
      t.date :check_date

      t.timestamps null: false
    end
  end
end
