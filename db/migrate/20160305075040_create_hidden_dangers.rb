#coding: utf-8
#隐患整改
class CreateHiddenDangers < ActiveRecord::Migration
  def change
    create_table :hidden_dangers do |t|
      t.references :org, index: true, null: false
      t.references :user, index: true, null: false
      t.date :table_date,null: false
      t.integer :danger_org_id,index:true,null: false
      t.integer :parent_id
      t.string :name,null: false,limit: 60
      t.date :danger_date,null: false
      t.integer :fix_period,null: false
      t.string :fixed_state,null: false,default: "draft",limit: 30
      t.date :fixed_date
      t.integer :fixer_id
      t.date :review_date
      t.string :review_state,null: false,default: 'draft'
      t.integer :reviewer_id
      t.text :note

      t.timestamps null: false
    end
  end
end
