#coding: utf-8
class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.references :org, index: true,null: false
      t.date :table_date,null: false
      t.references :user, index: true, null: true
      t.string :name,limit: 60,null: false
      t.date :training_date,null: false
      t.string :teachers,null: false
      t.integer :training_length,null: false,default: 1
      t.string :join_persons,null: false
      t.integer :join_count,default: 10
      t.text :training_content
      t.boolean :is_assess,default: false
      t.string :assess_type,limit: 20
      t.decimal :qualified_rate,precision: 15,scale: 2
      t.string :check_state,null: false,default: 'draft'
      t.text :check_opinion
      t.integer :checker_id
      t.date :check_date

      t.timestamps null: false
    end
  end
end
