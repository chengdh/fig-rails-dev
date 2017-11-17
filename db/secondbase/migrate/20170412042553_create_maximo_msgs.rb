#coding: utf-8
#maximo平台消息数据
class CreateMaximoMsgs < ActiveRecord::Migration
  def change
    create_table :maximo_msgs do |t|
      t.integer :order_id
      t.string :ordersource
      t.string :ordercode
      t.string :ordertypename
      t.string :ordertype
      t.string :ordertaskname
      t.integer :ordertaskid
      t.string :ordertitle
      t.integer :orderuserid
      t.string :orderusername
      t.datetime :ordertime
      t.string :url

      t.timestamps null: false
    end
  end
end
