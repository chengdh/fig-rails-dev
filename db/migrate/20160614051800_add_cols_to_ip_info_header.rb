#coding: utf-8
class AddColsToIpInfoHeader < ActiveRecord::Migration
  def change
      add_column :ip_info_headers,:table_date,:date,null: false
      rename_column :ip_info_headers,:state,:check_state
      add_column :ip_info_headers,:submitter_id,:integer
      add_column :ip_info_headers,:submit_date,:date
      add_column :ip_info_headers,:checker_id,:integer
      add_column :ip_info_headers,:check_date,:date
      add_column :ip_info_headers,:check_opinion,:string,limit: 60
      remove_column :ip_info_headers,:last_change_user_id
      remove_column :ip_info_headers,:last_check_user_id
  end
end
