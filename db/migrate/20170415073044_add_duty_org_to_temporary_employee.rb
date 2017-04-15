#coding: utf-8
class AddDutyOrgToTemporaryEmployee < ActiveRecord::Migration
  def change
    add_column :temporary_employees, :duty_org, :string,limit: 60
  end
end
