#coding: utf-8
#隐患整改
class HiddenDanger < ActiveRecord::Base
  belongs_to :org
  belongs_to :danger_org,class_name: "Org"
  belongs_to :user
  belongs_to :deliver,class_name: "User"

  acts_as_tree order: "danger_date ASC"

  #上报整改情况用户
  belongs_to :fixer,class_name: "User"
  #复查操作用户
  belongs_to :reviewer,class_name: "User"
  validates :user_id,:org_id,:danger_org_id,:name,:danger_date,:fix_period,:fixed_state,:review_state,presence: true
  default_value_for(:danger_date) {Date.today}
  default_value_for(:table_date) {Date.today}
  default_scope {order("danger_date ASC,fixed_state,review_state")}
  #待处理
  scope :waitting_process,->(org_ids){ where(fixed_state: "deliveried",danger_org_id: org_ids)}
  #待复查
  scope :waitting_review,->(org_ids){ where(fixed_state: "fixed",review_state: "draft",org_id: org_ids)}

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
    ret = "已下发" if fixed_state.eql?("deliveried")
    ret = "处理中" if fixed_state.eql?("processing")
    ret = "整改完成" if fixed_state.eql?("fixed")
    ret
  end
  def review_state_des
    ret = ""
    ret = "草稿(未处理)" if review_state.eql?("draft")
    ret = "合格" if review_state.eql?("review_ok")
    ret = "不合格" if review_state.eql?("review_reject")
    ret
  end
  #复查
  def review(review_ok = true,attrs)
    ret = false
    if review_ok
      attrs.merge!(review_state: "review_ok")
      ret = update_attributes(attrs)
    else
      attrs.merge!(review_state: "review_reject")
      ret = update_attributes(attrs)
      #创建新的隐患记录
      new_hidden_danger = HiddenDanger.new(parent_id: id,
                                           org_id: org_id,
                                           danger_org_id: danger_org_id,
                                           user_id: attrs[:reviewer_id],
                                           fix_period: fix_period,
                                           name: "#{name}第#{children.size + 1}次复查不合格")
      ret = new_hidden_danger.save!
      #下发新的隐患记录
      ret = new_hidden_danger.update_attributes(fixed_state: "deliveried",deliver_date: Date.today,deliver_id: attrs[:reviewer_id])
    end
    ret
  end

end
