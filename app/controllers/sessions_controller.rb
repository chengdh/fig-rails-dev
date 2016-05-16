#coding: utf-8
class SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    UserLog.create(user: resource,op_type: 1)
    super
  end
end
