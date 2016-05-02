#coding: utf-8
class CreateBasePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :base_purchase_orders do |t|
      t.string :name
      t.string :bill_no
      t.references :org, index: true
      t.date :bill_date,index: true
      t.references :user, index: true
      t.integer :f_location_id,index: true,null: false
      t.integer :t_location_id,index: true,null: false
      t.string :operator,limit: 30
      t.string :state,limit: 30,null: false
      t.string :type,limit: 60
      t.integer :confirmer_id,index: true
      t.date :confirm_date
      t.text :note
      t.timestamps null: false
    end
  end
end
