#coding: utf-8
#领导干部薪酬发放统计台帐
class CreateSalaryReportLeaders < ActiveRecord::Migration
  def change
    create_table :salary_report_leaders do |t|
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
