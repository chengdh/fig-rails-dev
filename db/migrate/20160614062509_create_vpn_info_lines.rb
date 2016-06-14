#coding: utf-8
class CreateVpnInfoLines < ActiveRecord::Migration
  def change
    create_table :vpn_info_lines do |t|
      t.references :vpn_info, index: true
      t.string :username,limit: 30,null: false
      t.string :pwd,limit: 30,null: false
      t.string :ip,limit: 60
      t.integer :own_org_id
      t.string :employee_name,limit: 30
      t.string :mobile,limit: 30
      t.string :power,limit: 200
      t.string :note,limit: 200

      t.timestamps null: false
    end
  end
end
