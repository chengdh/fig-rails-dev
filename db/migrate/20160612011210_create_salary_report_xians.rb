#coding: utf-8
#县级工资综合汇总表
class CreateSalaryReportXians < ActiveRecord::Migration
  def change
    create_table :salary_report_xians do |t|
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
