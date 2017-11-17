#coding: utf-8
class AddProcessedToMaximoMsg < ActiveRecord::Migration
  def change
    add_column :maximo_msgs,:processed,:boolean,default: false
  end
end
