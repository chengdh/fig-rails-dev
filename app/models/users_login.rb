#coding: utf-8
class UsersLogin < ActiveRecord::Base
  #自服务端同步更新数据
  def self.sync_with_ebs
    user_ids = pluck(:user_id)
    user_ids.each {|u_id| WfNotification.sync_with_ebs(u_id)}
  end
  def self.sync_with_maximo
    user_names = pluck(:username)
    user_names.each {|u_name| MaximoMsg.sync_with_maximo(u_name)}
  end
  def self.sync_all
    sync_with_ebs
    sync_with_maximo
  end
end
