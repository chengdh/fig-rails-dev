#coding: utf-8
#创建费用登记表
class CreateFeeInfos < ActiveRecord::Migration
  def change
    create_table :fee_infos do |t|
      t.references :user, index: true, foreign_key: true
      t.date :fee_date
      t.decimal :cr,precision: 15,scale: 2,default: 0.0
      t.decimal :dr,precision: 15,scale: 2,default: 0.0
      t.string :note,limit: 60

      t.timestamps null: false
    end
  end
end
