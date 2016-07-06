#coding: utf-8
#仓库信息
class Warehouse < ActiveRecord::Base
  belongs_to :org
  belongs_to :warehouse_type
  has_many :locations
  validates :name,:org_id, presence: true
  default_scope {order("warehouses.order_by ASC").includes(:locations)}
  def to_s
    name
  end
end
