#coding: utf-8
#考评表管理
class Assessment < ActiveRecord::Base
  belongs_to :org

  belongs_to :user
  belongs_to :checker,class_name: "User"

  belongs_to :submiter,class_name: "User"

  default_scope {order("table_date DESC")}
  default_value_for(:table_date) {Date.today}

  validates :org_id,:name,:mth,:table_date,:user_id, presence: true
  validates :k_safety_table_marks,
  :k_accident_marks,
  :k_training_marks,
  :k_planb_doc_marks,
  :k_meeting_marks,
  :k_hidden_danger_marks,
  :k_big_hidden_danger_marks,
  :k_big_accident_marks,
  :k_punishment_marks,
  :reward_marks, numericality: true

  def check_state_des
    ret = ""
    ret = "草稿(未审批)" if check_state.eql?("draft")
    ret = "已提交" if check_state.eql?("submited")
    ret = "通过" if check_state.eql?("confirmed")
    ret = "不通过" if check_state.eql?("rejected")
    ret
  end
  def sum_marks
    100 + reward_marks - k_safety_table_marks - k_accident_marks - k_training_marks -
      k_planb_doc_marks - k_meeting_marks- k_hidden_danger_marks - k_big_hidden_danger_marks -
      k_big_accident_marks - k_punishment_marks
  end

  #自动生成考评表
  #每月3号生成上月
  def self.auto_generate(mth,org_id)
  end
end
