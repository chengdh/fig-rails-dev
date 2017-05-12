#coding: utf-8
class CreatePoActionHistories < ActiveRecord::Migration
  def change
    create_table :po_action_history_a,id: false do |t|
      t.integer :object_id
      t.string :object_type_code
      t.string :object_sub_type_code
      t.integer :sequence_num
      t.date :last_update_date
      t.integer :last_updated_by
      t.date :creation_date
      t.integer :created_by
      t.string :action_code
      t.date :action_date
      t.integer :employee_id
      t.integer :approval_path_id
      t.string :note
      t.integer :object_revision_num
      t.string :offline_code
      t.integer :last_update_login
      t.integer :request_id
      t.integer :program_application_id
      t.integer :program_id
      t.date :program_update_date
      t.date :program_date
      t.integer :approval_group_id
      t.string :employee_name
      t.string :action_code_dsp

      t.timestamps null: false
    end
  end
end
