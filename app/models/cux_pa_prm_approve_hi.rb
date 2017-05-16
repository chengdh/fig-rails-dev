#coding: utf-8
#前期立项审批记录
class CuxPaPrmApproveHi < ActiveRecord::Base
  self.table_name = "cux_pa_prm_approve_his_a"
  belongs_to :cux_pm_pre_project,foreign_key: :entity_id

  def self.sync_with_ebs(cux_pa_ids)
    cux_pa_ids.each do |cux_pa_id|
      p_item_array = []
      p_item_array << {
        "VTYPE" => "INT",
        "VNAME" => "entity_id",
        "VVALUE" => cux_pa_id,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
  end
end
