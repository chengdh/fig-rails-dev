#coding: utf-8
#人力资源信息
class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :org, index: true, foreign_key: true,null: false
      t.string :name,null: false,limit: 30,index: true
      t.string :gender,limit: 1
      t.date :birthday
      t.string :academic,limit: 60
      t.string :graduate_from,limit: 60
      t.string :id_no,limit: 30
      t.string :mobile,limit: 20
      t.string :address,limit: 30
      t.string :email,limit: 30
      t.string :qq,limit: 20
      t.string :wechat,limit: 30
      #参加工作时间
      t.date :work_day
      #职位
      t.string :post,limit: 30
      t.text :note

      t.timestamps null: false
    end
  end
end
