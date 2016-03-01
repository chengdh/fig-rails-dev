#coding: utf-8
module TemporaryEmployeesHelper
  #岗位选择
  def posts_for_select
    ret = []
    posts = %w(驾驶员 送货员 保安人员 设备维保员 设备检测员 保洁员 绿化管理员 厨师 餐饮人员 电工 管道工 司炉工 水质化验员 电焊工)
    posts.each_with_index {|p,i| ret.push([p,"post_#{i}"])}
    ret
  end
end
