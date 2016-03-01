#coding: utf-8
class CreateTemporaryEmployees < ActiveRecord::Migration
  def change
    create_table :temporary_employees do |t|
      t.references :org, index: true,null: false
      t.string :name,limit: 30,null: false
      t.string :gender,limit: 10
      t.string :id_no,limit: 30
      t.integer :manage_org_id
      t.string :post,limit: 30
      t.string :belong_to_unit,limit: 60
      t.date :begin_date
      t.string :mobile,limit: 60
      t.boolean :is_active,default: true
      t.text :note

      t.timestamps null: false
    end
  end
end
