#coding: utf-8
class WfNotification < ActiveRecord::Base
  scope :unread,-> (user_id) {where(status: 'open',to_user: user_id)}
end
