#coding: utf-8
#劳动防护用品
class ProtectEquipment < ActiveRecord::Base
  belongs_to :protect_equipment_category
  belongs_to :org
  belongs_to :unit
  belongs_to :deliver_org,class_name: "Org"
  validates :protect_equipment_category_id,:org_id,:name, presence: true

  validates :qty,:save_days,:maintain_days, numericality: {only_integer: true, greater_than: 0}
  default_scope {order("org_id,protect_equipment_category_id")}

  def post_des
    ret = ""
    posts = %w(驾驶员 送货员 保安人员 设备维保员 设备检测员 保洁员 绿化管理员 厨师 餐饮人员 电工 管道工 司炉工 水质化验员 电焊工)
    posts.each_with_index do |p,i|
      ret = p if post.eql?("post_#{i}")
    end
    ret
  end
end
