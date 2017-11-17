#coding: utf-8
#项目过程审批历史记录
class CuxPaApproverListHi < ActiveRecord::Base
  self.table_name = "cux_pa_approver_list_his_v"
  belongs_to :cux_pa,foreign_key: :project_id
  default_scope {order("step ASC,approved_date ASC")}

  def self.sync_with_ebs(project_ids)
    cux_pas = CuxPa.where(id: project_ids)

    cux_pas.each do |cux_pa|
      p_item_array =  []
      p_item_array << {
        "VTYPE" => "VAR",
        "VNAME" => "item_key",
        "VVALUE" => cux_pa.wf_item_key,
        "VSIGN" => "EQ"
      }
      p_item_array << {
        "VTYPE" => "VAR",
        "VNAME" => "item_type",
        "VVALUE" => CuxPA::ITEM_TYPE,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
      #更新project_id
      where(wf_item_key: cux_pa.wf_item_key).update_all(project_id: cux_pa.id)
    end
  end
end
