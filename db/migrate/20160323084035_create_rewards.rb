#coding: utf-8
class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name,limit: 60,null: false
      t.references :org, index: true,null: false
      t.date :table_date,null: false
      t.references :user, index: true,null: false
      t.integer :checker_id
      t.string :check_state,limit: 60,default: "draft"
      t.date :check_date
      t.text :note
      t.integer :marks,default: 0

      t.timestamps null: false
    end
  end
end
