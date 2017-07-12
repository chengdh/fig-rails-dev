wf_itemkeys = WfNotification.where(fuser_id: @@user_id).pluck(:item_key)
CuxTran.sync_with_ebs(wf_itemkeys)
