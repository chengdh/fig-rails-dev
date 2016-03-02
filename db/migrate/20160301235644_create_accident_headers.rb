#coding: utf-8
#事故报告主表
class CreateAccidentHeaders < ActiveRecord::Migration
  def change
    create_table :accident_headers do |t|
      t.references :org, index: true, null: false
      t.string :mth,limit: 6,null: false
      t.date :table_date
      t.references :user, index: true
      t.text :note

      t.timestamps null: false
    end
  end
end
