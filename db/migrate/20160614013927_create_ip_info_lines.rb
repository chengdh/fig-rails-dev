#coding: utf-8
class CreateIpInfoLines < ActiveRecord::Migration
  def change
    create_table :ip_info_lines do |t|
      t.references :ip_info_header, index: true
      t.references :org, index: true
      t.string :post,limit: 60
      t.string :employee_name,limit: 30
      t.string :ip,limit: 60
      t.string :mac,limit: 60
      t.string :net_type,limit: 30
      t.text :note
      t.string :state,limit: 30

      t.timestamps null: false
    end
  end
end
