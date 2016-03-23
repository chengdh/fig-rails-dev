#coding: utf-8
class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.references :org, index: true, null: true
      t.date :table_date,null: false
      t.string :mth,limit: 20,null: false
      t.string :check_state,limit: 30,null: false,default: 'draft'
      t.references :user, index: true,null: false
      t.integer :checker_id
      t.date :check_date
      t.string :name,null: false,limit: 60
      t.text :note
      t.integer :k_safety_table_marks,default: 0
      t.integer :k_accident_marks,default: 0
      t.integer :k_training_marks,default: 0
      t.integer :k_planb_doc_marks,default: 0
      t.integer :k_meeting_marks,default: 0
      t.integer :k_hidden_danger_marks,default: 0
      t.integer :k_big_hidden_danger_marks,default: 0
      t.integer :k_big_accident_marks,default: 0
      t.integer :k_punishment_marks,default: 0
      t.integer :reward_marks,default: 0

      t.timestamps null: false
    end
  end
end
