#coding: utf-8
#外部网站对象
class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :name,limit: 60
      t.string :home_url,limit: 255
      t.string :backend_url,limit: 255
      t.boolean :is_active,default: true
      t.text :note

      t.timestamps null: false
    end
  end
end
