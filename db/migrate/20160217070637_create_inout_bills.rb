#coding: utf-8
class CreateInoutBills < ActiveRecord::Migration
  def change
    create_table :inout_bills do |t|
      t.references :org
      t.date :bill_date,null: false
      t.references :user, index: true
      t.integer :f_location_id,null: false
      t.integer :t_location_id,null: false
      t.string :operater,limit: 30
      t.string :state,limit: 60
      t.string :type,limit: 60
      t.text :note

      t.timestamps null: false
    end
  end
end
