#coding: utf-8
#角色-功能操作
class RoleSystemFunctionOperate < ActiveRecord::Base
  belongs_to :role,touch: true
  belongs_to :system_function_operate
  validates  :system_function_operate_id, presence: true
end
