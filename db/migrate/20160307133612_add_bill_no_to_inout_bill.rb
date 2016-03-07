#coding: utf-8
class AddBillNoToInoutBill < ActiveRecord::Migration
  def change
    #单据号
    add_column :inout_bills, :bill_no, :string,limit: 30
    add_column :inout_bills, :ref_partner, :string,limit: 60
    add_column :inout_bills, :name, :string,limit: 60
  end
end
