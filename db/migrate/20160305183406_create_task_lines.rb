#coding: utf-8
#任务反馈情况
class CreateTaskLines < ActiveRecord::Migration
  def change
    create_table :task_lines do |t|
      t.references :task, index: true, null: false
      t.text :note,null: false
      t.date :line_date,null: false
      t.references :user, index: true, null: false

      t.timestamps null: false
    end
  end
end
