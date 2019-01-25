#coding: utf-8
#工作流审批通知表
class CreateWfNotifications < ActiveRecord::Migration
  def change
    create_table :wf_notifications_a do |t|
      t.string :message_type,limit: 30
      t.string :status,limit: 20
      t.string :from_user,limit: 40
      t.string :to_user,limit: 40
      t.text :subject
      t.string :item_key,limit: 40

      t.timestamps null: false
    end
  end
end
