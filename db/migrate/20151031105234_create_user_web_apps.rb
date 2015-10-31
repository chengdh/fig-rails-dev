#coding: utf-8
#用户对应的app及用户名称
class CreateUserWebApps < ActiveRecord::Migration
  def change
    create_table :user_web_apps do |t|
      t.references :user, index: true, foreign_key: true,null: false
      t.references :web_app, index: true, foreign_key: true
      t.string :username,limit: 30
      t.string :password,limit: 30
      t.boolean :is_active,default: true

      t.timestamps null: false
    end
  end
end
