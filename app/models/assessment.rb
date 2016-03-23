#coding: utf-8
#考评表管理
class Assessment < ActiveRecord::Base
  belongs_to :org

  belongs_to :user
  belongs_to :checker,class_name: "User"

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
end
