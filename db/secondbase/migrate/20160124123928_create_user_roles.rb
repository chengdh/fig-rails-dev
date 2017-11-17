#coding: utf-8
#用户-角色
class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true
      t.boolean :is_select,default: false

      t.timestamps null: false
    end
  end
end
