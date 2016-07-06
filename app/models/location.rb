#coding: utf-8
#库位信息
class Location < ActiveRecord::Base
  LOC_TYPE_NORMAL = "normal_loc"
  LOC_TYPE_VENDOR = "vendor_loc"
  LOC_TYPE_REPAIR = "repair_loc"
  LOC_TYPE_WORTHLESS = "worthless_loc"
  LOC_TYPE_EMPLOYEE = "employee_loc"
  belongs_to :warehouse
  validates :warehouse_id,:name, presence: true
  default_scope {order("warehouse_id,locations.order_by ASC")}

  def to_s
    name
  end
end
