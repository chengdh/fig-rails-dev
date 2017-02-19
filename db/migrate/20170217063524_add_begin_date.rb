#coding: utf-8
class AddBeginDate < ActiveRecord::Migration
  def change
    add_column :wf_notifications_a,:begin_date,:date
    add_column :wf_notifications_a,:fuser_id,:integer
  end
end
