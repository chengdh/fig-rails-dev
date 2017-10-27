#coding: utf-8
class WfNotification < ActiveRecord::Base
  self.table_name = "wf_notifications_a"
  CUX_PM_PRE_PROJECTS_FROM = "
                    (SELECT WN.NOTIFICATION_ID,
                     WN.MESSAGE_TYPE,
                     WN.STATUS,
                     WN.BEGIN_DATE,
                     WN.END_DATE,
                     WN.FROM_USER,
                     WN.TO_USER,
                     NVL(WN.SUBJECT,wf_notification.GetSubject(WN.notification_id)) SUBJECT,
                     WN.ITEM_KEY,
                     fu.user_id as fuser_id　
                FROM WF_NOTIFICATIONS WN,
                     WF_USER_ROLES    WUR,
                     FND_USER         FU,
                     PER_PEOPLE_F     PPF
               WHERE (WN.MESSAGE_TYPE, WN.ITEM_KEY) IN
                     (SELECT CL.WF_ITEM_TYPE, CL.WF_ITEM_KEY
                        FROM CUX_APPROVER_LIST_HEADERS CH,
                             CUX_APPROVER_LIST_LINES   CL
                       WHERE CL.LIST_HEADER_ID = CH.LIST_HEADER_ID
                         AND CH.ENTITY = 'CUX_PM_PRE_PROJECTS_ALL'
                         AND CL.WF_ITEM_TYPE IS NOT NULL
                       GROUP BY CL.WF_ITEM_TYPE, CL.WF_ITEM_KEY)
                 AND WN.RECIPIENT_ROLE = WUR.ROLE_NAME
                 AND WUR.USER_NAME = FU.USER_NAME
                 AND FU.EMPLOYEE_ID = PPF.PERSON_ID
                 AND PPF.EFFECTIVE_START_DATE <= SYSDATE
                 AND NVL(PPF.EFFECTIVE_END_DATE, SYSDATE + 1) >= SYSDATE
                 AND WN.STATUS = 'OPEN') K,
                WF_ITEM_TYPES_TL T"

  CUX_PM_PRE_PROJECTS_SELECT = "K.NOTIFICATION_ID,
             K.MESSAGE_TYPE AS ITEM_TYPE,
             K.STATUS,
             K.BEGIN_DATE,
             K.END_DATE,
             K.FROM_USER,
             K.TO_USER,
             K.SUBJECT,
             K.ITEM_KEY,
             K.FUSER_ID,
             T.DISPLAY_NAME AS ITEM_TYPE_NAME,
             'Y' AS ISFYI"

  CUX_PM_PRE_PROJECTS_WHERE = "K.MESSAGE_TYPE = T.NAME
         AND K.FUSER_ID = ?
         AND T.LANGUAGE = 'ZHS'"
  scope :unread,-> (user_id) {where(status: 'OPEN',fuser_id: user_id)}
  scope :unread_for_cux_pm_pre_projects,-> (user_id) {from(CUX_PM_PRE_PROJECTS_FROM).
                                                      select(CUX_PM_PRE_PROJECTS_SELECT).
                                                      where(CUX_PM_PRE_PROJECTS_WHERE,[user_id])}

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
