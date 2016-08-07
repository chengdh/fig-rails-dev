#coding: utf-8
class CreateCompanyVpnLines < ActiveRecord::Migration
  def change
    create_table :company_vpn_lines do |t|
      t.references :company_vpn, index: true
      t.string :username,limit: 30,null: false
      t.string :pwd,limit: 30
      t.string :ip,limit: 60
      t.integer :own_org_id
      t.string :employee_name,limit: 30
      t.string :post,limit: 200
      t.string :mobile,limit: 30
      t.string :power,limit: 200
      t.string :note,limit: 200

      t.timestamps null: false
    end
  end
end
