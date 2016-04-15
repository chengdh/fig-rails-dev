#coding: utf-8
#事故月报主表
class AccidentHeader < ActiveRecord::Base
  include ModelStateMachine
  belongs_to :org
  belongs_to :user
  belongs_to :submitter,class_name: "User"
  belongs_to :checker,class_name: "User"
  has_many :accidents
  validates :org_id,:mth,:table_date, presence: true
  accepts_nested_attributes_for :accidents
  default_scope {order("mth DESC,org_id ASC")}
  default_value_for(:table_date) {Date.today} 
  default_value_for(:mth) {1.month.ago.strftime("%Y%m")}

  #待审批
  scope :waitting_confirm,->(org_ids){ where(check_state: "draft",org_id: org_ids)}
  #待修改
  scope :rejected,->(org_id){ where(check_state: "rejected",org_id: org_id)}
end
