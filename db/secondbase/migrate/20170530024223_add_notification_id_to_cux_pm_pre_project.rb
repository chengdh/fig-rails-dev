#coding: utf-8
class AddNotificationIdToCuxPmPreProject < ActiveRecord::Migration
  def change
    add_column :cux_pm_pre_projects_a, :notification_id, :integer
  end
end
