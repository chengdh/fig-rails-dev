#coding: utf-8
#仓库类型
class WarehouseType < ActiveRecord::Base
  validates :name, presence: true
  default_scope {order("order_by ASC")}
end
