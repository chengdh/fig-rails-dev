#coding: utf-8
#ip地址信息
class IpInfoLine < ActiveRecord::Base
  belongs_to :ip_info_header
  belongs_to :org
  validates :post,:ip,:mac,:employee_name,presence: true
  default_value_for :state,"draft"

  #状态
  def state_des
    ret = ""
    ret = "草稿(未审批)" if state.eql?("draft")
    ret = "待审核" if state.eql?("submitted")
    ret = "通过" if state.eql?("confirmed")
    ret = "不通过" if state.eql?("rejected")
    ret
  end

  #根据fixed_state获取在前端显示的颜色
  #待整改 -- 黄色
  #待复查 -- 蓝色
  #整改合格 -- 绿色
  #整个不合格 -- 红色
  def state_class
    css = ""
    css = "label label-warning" if ["submitted"].include?(state)
    css = "label label-draft" if ["draft"].include?(state)
    css = "label label-success" if ["confirmed"].include?(state)
    css = "label label-danger" if state.eql?("rejected")
    css
  end
end
