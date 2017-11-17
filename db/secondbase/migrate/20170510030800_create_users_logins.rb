#coding: utf-8
class CreateUsersLogins < ActiveRecord::Migration
  def change
    create_table :users_logins do |t|
      t.integer :user_id
      t.string :username,limit: 60
      t.datetime :login_date

      t.timestamps null: false
    end
  end
end
