#coding: utf-8
class ChangeMaximoMsgTable < ActiveRecord::Migration
  def change
    add_column :maximo_msgs,:processname,:string
    add_column :maximo_msgs,:processrev,:integer
    add_column :maximo_msgs,:nodeid,:integer
  end
end
