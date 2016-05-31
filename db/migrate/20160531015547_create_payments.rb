#coding: utf-8
#用户付费记录
class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :app,limit: 60
      t.integer :cbi,default: 0
      t.integer :ct,default: 0

      t.integer :fee,default: 0

      t.integer :pt,default: 0

      t.string :sdk,limit: 60

      t.string :ssid,limit: 60

      t.integer :st,default: 0

      t.string :tcd,limit: 60
      t.string :uid,limit: 60
      t.string :ver,limit: 60
      t.string :sign,limit: 60

      t.timestamps null: false
    end
  end
end
