#coding: utf-8
#角色-功能操作
class CreateRoleSystemFunctionOperates < ActiveRecord::Migration
  def change
    create_table :role_system_function_operates do |t|
      t.references :role, index: true, foreign_key: true
      t.references :system_function_operate,  foreign_key: true
      t.boolean :is_select,default: false

      t.timestamps null: false
    end
  end
end
