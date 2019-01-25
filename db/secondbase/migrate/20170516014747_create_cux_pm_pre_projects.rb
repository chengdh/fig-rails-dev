#coding: utf-8
class CreateCuxPmPreProjects < ActiveRecord::Migration
  def change
    create_table :cux_pm_pre_projects_a,id: false do |t|
      t.integer :project_id
      t.integer :org_id
      t.string :unit_code
      t.string :short_name
      t.string :project_name
      t.string :project_type_code
      t.string :tproject_type
      t.integer :project_template
      t.string :project_template_name
      t.integer :project_year
      t.integer :project_responsor_id
      t.string :project_responsor
      t.string :project_creator
      t.date :start_date
      t.date :end_date
      t.decimal :apply_amount,precision: 15,scale: 2
      t.decimal :approved_amount,precision: 15,scale: 2
      t.string :comments
      t.integer :pa_project_id
      t.integer :pa_project_number
      t.string :project_status_code
      t.string :project_status_name
      t.string :wf_item_type
      t.string :wf_item_key
      t.string :status_lookup_code
      t.string :status_tag
      t.string :status
      t.string :attachment_flag
      t.date :last_update_date
      t.integer :last_updated_by
      t.date :creation_date
      t.integer :created_by
      t.integer :last_update_login
      t.integer:object_version_number
      t.timestamps null: false
    end
  end
end
