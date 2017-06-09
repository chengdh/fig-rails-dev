#coding: utf-8
class WfNotification < ActiveRecord::Base
  self.table_name = "wf_notifications_a"
  scope :unread,-> (user_id) {where(status: 'OPEN',fuser_id: user_id)}

  def self.sync_with_ebs(user_id)
    p_item_array = [
      {
        "VTYPE" => "NUM",
        "VNAME" => "fuser_id",
        "VVALUE" => user_id,
        "VSIGN" => "EQ"
      },
      {
        "VTYPE" => "VAR",
        "VNAME" => "status",
        "VVALUE" => "OPEN",
        "VSIGN" => "EQ"
      }
    ]
    TestSoap.sync_table(self,p_item_array)
    wf_itemkeys = WfNotification.where(fuser_id: user_id).pluck(:item_key)

    #同步
    CuxDemand.sync_with_ebs(wf_itemkeys)
    CuxTran.sync_with_ebs(wf_itemkeys)
    PoHeader.sync_with_ebs(wf_itemkeys)
    CuxApInvoice.sync_with_ebs(wf_itemkeys)
    #同步前期立项
    CuxPmPreProject.sync_with_ebs(user_id)
    #同步项目审批
    wf_ids_for_cux_pa = WfNotification.where(fuser_id: user_id,message_type: CuxPa::WF_ITEM_TYPE).pluck(:id)
    CuxPa.sync_with_ebs(wf_ids_for_cux_pa)

    #总账日记账
    CuxGlJeHeader.sync_with_ebs(wf_itemkeys)
  end
  def self.sync_with_ebs_only_wf(user_id)
    p_item_array = [
      {
        "VTYPE" => "NUM",
        "VNAME" => "fuser_id",
        "VVALUE" => user_id,
        "VSIGN" => "EQ"
      },
      {
        "VTYPE" => "VAR",
        "VNAME" => "status",
        "VVALUE" => "OPEN",
        "VSIGN" => "EQ"
      }
    ]
    TestSoap.sync_table(self,p_item_array)
  end
end
