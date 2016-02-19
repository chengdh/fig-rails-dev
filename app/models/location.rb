#coding: utf-8
#库位信息
class Location < ActiveRecord::Base
  belongs_to :warehouse
  validates :warehouse_id,:name, presence: true
  default_scope {order("warehouse_id,order_by ASC")}
end
