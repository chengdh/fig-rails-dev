#coding: utf-8
class AddRenterToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :renter, :string,limit: 60
  end
end
