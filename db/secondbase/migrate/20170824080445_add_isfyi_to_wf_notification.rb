#coding: utf-8
class AddIsfyiToWfNotification < ActiveRecord::Migration
  def change
    add_column :wf_notifications_a,:isfyi,:string,limit: 10
  end
end
