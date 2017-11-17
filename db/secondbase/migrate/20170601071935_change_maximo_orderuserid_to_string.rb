#coding: utf-8
class ChangeMaximoOrderuseridToString < ActiveRecord::Migration
  def change
    change_column :maximo_msgs,:orderuserid,:string
  end
end
