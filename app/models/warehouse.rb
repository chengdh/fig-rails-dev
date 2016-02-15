#coding: utf-8
#仓库信息
class Warehouse < ActiveRecord::Base
  belongs_to :org
  belongs_to :warehouse_type
  validates :name,:org_id, presence: true
  default_scope {order("order_by ASC")}
end
