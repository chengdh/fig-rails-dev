#coding: utf-8
#事故类型
class AccidentType < ActiveRecord::Base
  validates :name, presence: true
  default_scope {order("order_by")}
end
