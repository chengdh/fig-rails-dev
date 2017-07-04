#同步项目审批
wf_ids_for_cux_pa = WfNotification.where(fuser_id: @@user_id,message_type: CuxPa::WF_ITEM_TYPE).pluck(:id)
CuxPa.sync_with_ebs(wf_ids_for_cux_pa)


