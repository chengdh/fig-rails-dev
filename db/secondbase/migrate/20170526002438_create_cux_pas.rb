#coding: utf-8
#项目过程审批
class CreateCuxPas < ActiveRecord::Migration
  def change
    create_table :cux_pas,id: false do |t|
      t.integer :project_id
      t.string :pa_project_number
      t.string :project_name
      t.string :project_status_name
      t.string :carrying_out_org_name
      t.integer :carrying_out_org_id
      t.string :project_type
      t.string :workflow_started_by_name
      t.string :project_approver_full_name

      t.timestamps null: false
    end
  end
end
