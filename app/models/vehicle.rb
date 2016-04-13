#coding: utf-8
#交通工具信息
class Vehicle < ActiveRecord::Base
  belongs_to :org
  validates :org_id,:vehicle_no,:register_no,:license_no, presence: true
  default_scope {order("org_id DESC")}
  def to_s
    vehicle_no
  end
end
