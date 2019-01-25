#coding: utf-8
class AddProjectId2CuxPaApproverListHis < ActiveRecord::Migration
  def change
    add_column :cux_pa_approver_list_his_v,:project_id,:integer
  end
end
