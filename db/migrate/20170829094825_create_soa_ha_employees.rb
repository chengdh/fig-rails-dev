#coding: utf-8
#员工信息
class CreateSoaHaEmployees < ActiveRecord::Migration
  def change
    create_table :soa_hr_employee_a do |t|
      t.integer :org_id
      t.string :employee_number
      t.string :last_name
      t.datetime :effective_start_date
      t.datetime :effective_end_date
      t.date :date_of_birth
      t.string :sex
      t.integer :dept_id
      t.string :dept_name
      t.integer :job_id
      t.string :job_name
      t.integer :position_id
      t.string :position_name
      t.integer :created_by
      t.datetime :creation_date
      t.integer :last_updated_by
      t.datetime :last_update_date
      t.string :run_person_yn

      t.timestamps null: false
    end
  end
end
