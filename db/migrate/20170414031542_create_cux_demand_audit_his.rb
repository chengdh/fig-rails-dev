#coding: utf-8
#需求计划审批历史表
class CreateCuxDemandAuditHis < ActiveRecord::Migration
  def change
    create_table :cux_posa_item_activity_his_a,id: false do |t|
      t.integer :submit_by_org_id
      t.string :submit_by_org_name,limit: 60
      t.string :submit_schedule_type,limit: 60

      t.string :submit_schedule_yqmj,limit: 60

      t.integer :submit_org_level
      t.integer :submit_from
      t.text :response_message

      t.datetime :submit_date
      t.string :item_type
      t.string :item_key,limit: 60
      t.string :activity_result_code,limit: 60
      t.string :result_name,limit: 60
      t.string :assigned_user,limit: 60
      t.string :full_name,limit: 60
      t.integer :notification_id
      t.datetime :begin_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
