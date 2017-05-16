#coding: utf-8
#固定资产转移审批
class CreateCuxFaTrasferHis < ActiveRecord::Migration
  def change
    create_table :cux_fa_trasfer_his,id: false do |t|
      t.integer :header_id
      t.integer :h_notification_id
      t.date :h_action_date
      t.integer :h_sequence
      t.string :h_from_role
      t.string :h_from_user
      t.string :h_to_role
      t.string :h_to_user
      t.string :h_action
      t.string :h_comment
      t.string :responder

      t.timestamps null: false
    end
  end
end
