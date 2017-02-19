#coding: utf-8
class WfNotification < ActiveRecord::Base
  self.table_name = "wf_notifications_a"
  scope :unread,-> (user_id) {where(status: 'open',to_user: user_id)}
end
