#coding: utf-8
#前期立项审批记录
class CreateCuxPaPrmApproveHis < ActiveRecord::Migration
  def change
    create_table :cux_pa_prm_approve_his_a,id: false do |t|
      t.integer :entity_id
      t.integer :step
      t.string :action_desc
      t.date :action_date
      t.string :action_employee_name
      t.string :approve_note

      t.timestamps null: false
    end
  end
end
