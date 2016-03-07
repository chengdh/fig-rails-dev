#coding: utf-8
class AddLocationTypeToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :location_type, :string,null: false,limit: 60,default: "normal_loc"
  end
end
