#coding: utf-8
class AddBrandToInoutBillLine < ActiveRecord::Migration
  def change
    add_column :inout_lines, :no, :string,limit: 30
    add_column :inout_lines, :brand, :string,limit: 40
    add_column :inout_lines, :model, :string,limit: 60
    add_column :inout_lines, :purchase_date, :date
    add_column :inout_lines, :own_org_id, :integer
    add_column :inout_lines, :duty_person, :string,limit: 30
    add_column :inout_lines, :note, :text
  end
end
