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
  end
end
