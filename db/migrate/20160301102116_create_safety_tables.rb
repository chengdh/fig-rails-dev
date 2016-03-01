#coding: utf-8
#安全月报
class CreateSafetyTables < ActiveRecord::Migration
  def change
    create_table :safety_tables do |t|
      t.references :org, index: true, null: false
      t.string :mth,limit: 6,null: false
      t.integer :safety_check_count,default: 0
      t.integer :special_safety_check_count,default: 0
      t.integer :evening_safety_check_count,default: 0
      t.integer :danger_count,default: 0
      t.integer :fixed_danger_count,default: 0
      t.integer :third_edu_persons,default: 0
      t.decimal :third_edu_percent,precision: 15,scale: 2
      t.integer :special_worker_edu_persons,default: 0
      t.decimal :special_worker_edu_percent,precision: 15,scale: 2
      t.integer :common_edu_persons,default: 0
      t.integer :no_duplicate_persons,default: 0
      t.decimal :common_edu_percent,precision: 15,scale: 2
      t.decimal :invest_equipment_money,precision: 15,scale: 2
      t.decimal :invest_faclities_money,precision: 15,scale: 2
      t.decimal :fixed_danger_money,precision: 15,scale: 2
      t.decimal :safety_edu_money,precision: 15,scale: 2
      t.decimal :safety_reward_money,precision: 15,scale: 2
      t.integer :safety_meeting_count,default: 0
      t.integer :safety_meeting_persons,default: 0
      t.integer :safety_meeting_solve_questions,default: 0
      t.date :table_date
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
