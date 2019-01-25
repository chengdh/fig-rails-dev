#coding: utf-8
class CreateFndUsers < ActiveRecord::Migration
  def change
    create_table :fnd_user_a do |t|
      t.integer :user_id
      t.string :user_name
      t.datetime :last_update_date
      t.integer :last_updated_by
      t.datetime :creation_date
      t.integer :created_by
      t.datetime :last_update_login
      t.string :description
      t.datetime :last_logon_date
      t.datetime :password_date
      t.integer :employee_id
      t.string :email_address
      t.string :fax
      t.integer :customer_id
      t.integer :supplier_id
      t.string :web_password
      t.integer :gcn_code_combination_id
      t.integer :person_party_id


      t.timestamps null: false
    end
  end
end
