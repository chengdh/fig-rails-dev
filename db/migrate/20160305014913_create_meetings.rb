#coding: utf-8
#会议记录
class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.references :org, index: true, null: true
      t.references :user, index: true, null: true
      t.date :table_date
      t.string :name,null: false,limit: 60
      t.date :meeting_date,null: false
      t.integer :meeting_length,null: false,default: 2
      t.string :presenter,null: false,limit: 30
      t.string :join_persons,null: false,limit: 200
      t.integer :join_count,null: false,default: 10
      t.text :meeting_content,null: false
      t.string :check_state,limit: 30,default: 'draft'
      t.string :check_opinion,limit: 100
      t.integer :checker_id
      t.date :check_date
      t.text :note

      t.timestamps null: false
    end
  end
end
