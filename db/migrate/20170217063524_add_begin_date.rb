#coding: utf-8
class AddBeginDate < ActiveRecord::Migration
  def change
    add_column :wf_notifications,:begin_date,:date
    add_column :wf_notifications,:fuser_id,:integer
  end
end
