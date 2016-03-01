#coding: utf-8
class SpecWarehouse < ActiveRecord::Base
  belongs_to :org
  validates :warehouse_type,:name,:org_id, presence: true
  default_scope {order("org_id,warehouse_type")}

  def warehouse_type_des
    ret = ""
    ret = "卷烟物流中心仓库" if warehouse_type.eql?('center_warehouse')
    ret = "烟叶收购站" if warehouse_type.eql?('station_warehouse')
    ret
  end

  def fire_level_des
    ret = ""
    ret = "1级" if fire_level == 1
    ret = "2级" if fire_level == 2
    ret = "3级" if fire_level == 3
    ret = "4级" if fire_level == 4
    ret
  end
end
