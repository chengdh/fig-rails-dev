#coding: utf-8
#web_app 设置信息
class CreateWebApps < ActiveRecord::Migration
  def change
    create_table :web_apps do |t|
      t.string :name,limit: 60,null: false
      t.string :form_el_username,limit: 60,null: false
      t.string :form_el_password,limit: 60,null: false
      t.string :form_method,limit: 30,null: false,default: "post"
      t.string :form_action,limit: 200,null: false

      t.boolean :is_active,defalut: true

      t.timestamps null: false
    end
  end
end
