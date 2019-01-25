#coding: utf-8
#项目过程审批-任务预算
class CreateCuxPaTasks < ActiveRecord::Migration
  def change
    create_table :cux_pa_tasks,id: false do |t|
      t.string :projects_num
      t.string :projects_name
      t.integer :project_id
      t.integer :task_id
      t.integer :level1
      t.string :task_number
      t.string :task_name
      t.decimal :cost_amt,precision: 15,scale: 2,default: 0
      t.decimal :budget_amt,precision: 15,scale: 2,default: 0

      t.timestamps null: false
    end
  end
end
