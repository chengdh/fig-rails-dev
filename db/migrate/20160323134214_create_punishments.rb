#coding: utf-8
#处罚情况
class CreatePunishments < ActiveRecord::Migration
  def change
    create_table :punishments do |t|
      t.references :org, index: true, null: false
      t.references :user, index: true, null: false
      t.integer :punish_org_id,index: true,null: false
      t.date :table_date,null: false,index: true
      t.string :name,limit: 60,null: false
      t.integer :marks,default: 0
      t.text :note
      t.integer :poster_id
      t.date :post_date
      t.date :punish_date
      t.string :check_state,limit: 30,default: 'draft'

      t.timestamps null: false
    end
  end
end
