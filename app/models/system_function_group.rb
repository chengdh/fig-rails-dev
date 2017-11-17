#coding: utf-8
#功能分组
class SystemFunctionGroup < ActiveRecord::Base
  validates :name, presence: true
  has_many :system_functions
  default_scope {order("order_by ASC")}
end
