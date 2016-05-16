#coding: utf-8
class CreateUserLogs < ActiveRecord::Migration
  def change
    create_table :user_logs do |t|
      t.references :user, index: true
      t.string :op_type,limit: 30

      t.timestamps null: false
    end
  end
end
