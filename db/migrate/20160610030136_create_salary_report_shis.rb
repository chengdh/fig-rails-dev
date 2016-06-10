#coding: utf-8
#工资表-市局机关汇总表
class CreateSalaryReportShis < ActiveRecord::Migration
  def change
    create_table :salary_report_shis do |t|
      t.string :name,null: false,limit: 60
      t.integer :year,null: false
      t.references :org, index: true,null: false
      t.date :table_date
      t.references :user, index: true
      t.text :note

      t.timestamps null: false
    end
  end
end
