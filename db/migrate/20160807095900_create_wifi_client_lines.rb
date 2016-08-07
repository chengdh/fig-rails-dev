#coding: utf-8
class CreateWifiClientLines < ActiveRecord::Migration
  def change
    create_table :wifi_client_lines do |t|
      t.references :wifi_client, index: true
      t.string :username,limit: 30,null: false
      t.integer :own_org_id
      t.string :mac,limit: 30
      t.string :dev_type,limit: 30
      t.string :mobile,limit: 30
      t.string :ip,limit: 60
      t.string :employee_name,limit: 30
      t.string :note,limit: 200

      t.timestamps null: false
    end
  end
end
