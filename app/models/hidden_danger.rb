#coding: utf-8
#隐患整改
class HiddenDanger < ActiveRecord::Base
  belongs_to :org
  belongs_to :danger_org,class_name: "Org"
  belongs_to :user
  acts_as_tree order: "danger_date ASC"

  #上报整改情况用户
  belongs_to :fixer,class_name: "User"
  #复查操作用户
  belongs_to :reviewer,class_name: "User"
  validates :user_id,:org_id,:danger_org_id,:name,:danger_date,:fix_period,:fixed_state,:review_state,presence: true
  default_value_for(:danger_date) {Date.today}
  default_value_for(:table_date) {Date.today}
  default_scope {order("danger_date ASC,fixed_state,review_state")}

  def fix_period_des
    ret = ""
    ret = "15日" if fix_period == 15
    ret = "1个月" if fix_period == 30
    ret = "3个月" if fix_period == 90
    ret = "6个月" if fix_period == 180
    ret
  end
  def fixed_state_des
    ret = ""
    ret = "草稿(未处理)" if fixed_state.eql?("draft")
    ret = "处理中" if fixed_state.eql?("processing")
    ret = "整改完成" if fixed_state.eql?("fixed")
    ret
  end
  def review_state_des
    ret = ""
    ret = "草稿(未处理)" if review_state.eql?("draft")
    ret = "合格" if review_state.eql?("review_ok")
    ret = "不合格" if review_state.eql?("review_err")
    ret
  end

end
