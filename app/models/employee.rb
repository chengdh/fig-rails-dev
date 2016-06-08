#coding: utf-8
#雇员信息
class Employee < ActiveRecord::Base
  #在岗
  WORK_STATE_ON_DUTY = "on_duty"
  #内退
  WORK_STATE_RETIRED = "retired"
  #遍外离岗
  WORK_STATE_NO_STAFF = "non_staff"

  belongs_to :org
  belongs_to :user
  validates :name,:org_id, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  default_scope {order("org_id")}
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def work_state_des
    ret = ""
    ret = "在岗" if work_state.eql?("on_duty")
    ret = "内退" if work_state.eql?("retired")
    ret = "编外离岗" if work_state.eql?("non_staff")
    ret
  end
  def post_level_des
    ret = ""
    ret = "领导" if post_level == 1
    ret = "正科" if post_level == 2
    ret = "正协" if post_level == 3
    ret = "副科" if post_level == 4
    ret = "副协" if post_level == 5
    ret = "一般人员" if post_level == 9
    ret
  end
  def belongs_party_des
    ret = ""
    ret = "一支部" if belongs_party.eql?('party_1')
    ret = "二支部" if belongs_party.eql?('party_2')
    ret = "三支部" if belongs_party.eql?("party_3")
    ret
  end
  def is_not_main_des
    ret = ""
    ret = "三产" if is_not_main
    ret = "在册" unless is_not_main
    ret
  end

  def is_party_member_des
    ret = ""
    ret = "是" if is_party_member
    ret = "否" unless is_party_member
    ret
  end
end
