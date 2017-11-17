#coding: utf-8
class CreateApWfapprovalHistories < ActiveRecord::Migration
  def change
    create_table :ap_wfapproval_history_v,id: false do |t|
      t.integer :invoice_id
      t.integer :line_number
      t.string :response
      t.integer :person_id
      t.string :approver_name
      t.decimal :amount_approved,precision: 15,scale: 2
      t.string :approver_comments
      t.date :last_update_date
      t.string :response_dsp
      t.integer :iteration
      t.string :approval_context
      t.string :approval_context_dsp
      t.integer :approver_order_number
      t.timestamps null: false
    end
  end
end
