#coding: utf-8
class CreateIpInfoHeaders < ActiveRecord::Migration
  def change
    create_table :ip_info_headers do |t|
      t.references :org, index: true
      t.references :user, index: true
      t.string :state,limit: 60,null: false,default: 'draft'
      t.text :note
      t.integer :last_change_user_id
      t.timestamps :last_change_time

      t.integer :last_check_user_id
      t.timestamps :last_check_time

      t.timestamps null: false
    end
  end
end
