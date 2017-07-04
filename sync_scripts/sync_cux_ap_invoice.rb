wf_itemkeys = WfNotification.where(fuser_id: @@user_id).pluck(:item_key)
CuxApInvoice.sync_with_ebs(wf_itemkeys)
