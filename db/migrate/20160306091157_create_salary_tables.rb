#coding: utf-8
class CreateSalaryTables < ActiveRecord::Migration
  def change
    create_table :salary_tables do |t|
      t.references :org, index: true, null: true
      t.string :name,null: false,limit: 60
      t.string :mth,null: false,limit: 6
      t.date :table_date
      t.text :note
      t.references :user, index: true, null: false

      t.timestamps null: false
    end
  end
end
