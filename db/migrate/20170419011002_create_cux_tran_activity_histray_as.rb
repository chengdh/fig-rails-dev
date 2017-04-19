#coding: utf-8
class CreateCuxTranActivityHistrayAs < ActiveRecord::Migration
  def change
    create_table :cux_tran_activity_histray_as do |t|
      t.string :response_message
      t.string :item_type
      t.string :item_key
      t.string :activity_result_code
      t.string :result_name
      t.string :assigned_user
      t.string :full_name
      t.integer :notification_id
      t.datetime :begin_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
