#coding: utf-8
#房舍及院落
class House < ActiveRecord::Base
  belongs_to :org
  validates :org_id,:name, presence: true
  validates :building_area, numericality: { greater_than_or_equal_to: 0}
  default_scope {order("org_id")}
end
