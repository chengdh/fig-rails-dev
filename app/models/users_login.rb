#coding: utf-8
class UsersLogin < ActiveRecord::Base
  #自服务端同步更新数据
  def self.sync_with_ebs
    user_ids = pluck(:user_id)
    user_ids.each {|u_id| WfNotification.sync_with_ebs(u_id)}
  end
end
