#coding: utf-8
class AddNotificationIdToCuxPmPas < ActiveRecord::Migration
  def change
    add_column :cux_pas, :notification_id, :integer
    add_column :cux_pas, :wf_item_key, :string
  end
end
