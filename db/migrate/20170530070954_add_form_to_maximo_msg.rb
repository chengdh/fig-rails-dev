#coding: utf-8
class AddFormToMaximoMsg < ActiveRecord::Migration
  def change
    add_column :maximo_msgs,:form,:text
    add_column :maximo_msgs,:ordertable,:string
  end
end
