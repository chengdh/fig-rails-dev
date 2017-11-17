#coding: utf-8
#功能操作
class SystemFunctionOperate < ActiveRecord::Base
  belongs_to :system_function
  validates :name,:system_function_id, presence: true
  default_scope {order("order_by ASC")}
  serialize :function_obj
end
