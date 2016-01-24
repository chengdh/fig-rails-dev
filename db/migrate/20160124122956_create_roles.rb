#coding: utf-8
class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name,null: false,limit: 60
      t.boolean :is_active,default: true
      t.integer :order_by

      t.timestamps null: false
    end
  end
end
