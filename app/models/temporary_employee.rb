#coding: utf-8
#相关方人员管理
class TemporaryEmployee < ActiveRecord::Base
  validates :org_id,:name, presence: true
  belongs_to :org
  belongs_to :manage_org,class_name: "Org"
  default_scope {order("org_id")}

  def post_des
    ret = ""
    posts = %w(驾驶员 送货员 保安人员 设备维保员 设备检测员 保洁员 绿化管理员 厨师 餐饮人员 电工 管道工 司炉工 水质化验员 电焊工)
    posts.each_with_index do |p,i|
      ret = p if post.eql?("post_#{i}")
    end
    ret
  end
end
