#coding: utf-8
#仓库信息
class Warehouse < ActiveRecord::Base
  belongs_to :org
  belongs_to :warehouse_type
  has_many :locations
  validates :name,:org_id, presence: true
  default_scope {order("order_by ASC")}
  def to_s
    name
  end
end
