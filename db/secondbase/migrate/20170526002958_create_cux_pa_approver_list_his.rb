#coding: utf-8
#项目过程审批历史记录
class CreateCuxPaApproverListHis < ActiveRecord::Migration
  def change
    create_table :cux_pa_approver_list_his_v,id: false do |t|
      t.integer :step
      t.string :user_name
      t.string :last_name
      t.string :status_lookup_code
      t.date :approved_date
      t.string :comments
      t.string :wf_item_type
      t.string :wf_item_key

      t.timestamps null: false
    end
  end
end
