#coding: utf-8
#用户操作记录
class UserLog < ActiveRecord::Base
  default_scope {order("created_at DESC")}
  belongs_to :user

  def op_type_des
    ret = ""
    ret = "登录" if op_type == 1
    ret = "退出" if op_type == 2
    ret
  end
end
