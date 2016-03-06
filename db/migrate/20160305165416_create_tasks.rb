#coding: utf-8
class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :org, index: true, null: false
      t.references :user, index: true, null: false
      t.references :task_category, index: true
      t.date :task_date
      t.string :name,null: false,limit: 60
      t.text :note
      t.integer :executer_id,null: false
      t.string :state,limit: 30,null: false,default: "draft"

      #下发
      t.integer :deliver_id, index: true
      t.date :deliver_date, index: true

      #完成
      t.integer :finisher_id,index: true
      t.date :finish_date,index:true

      #确认
      t.date :confirm_date
      t.integer :confirmer_id

      t.timestamps null: false
    end
  end
end
