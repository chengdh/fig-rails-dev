#coding: utf-8
#奖励情况下级--上级
class Reward < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  belongs_to :checker,class_name: "User"

  default_scope {order("table_date DESC")}
  default_value_for(:table_date) {Date.today}

  validates :org_id,:name,:table_date,:user_id,:note, presence: true

  has_attached_file :photo_1, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_1, content_type: /\Aimage\/.*\Z/

  has_attached_file :photo_2, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_2, content_type: /\Aimage\/.*\Z/

  has_attached_file :photo_3, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_3, content_type: /\Aimage\/.*\Z/

  has_attached_file :photo_4, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_4, content_type: /\Aimage\/.*\Z/

  has_attached_file :photo_5, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_5, content_type: /\Aimage\/.*\Z/

  has_attached_file :photo_6, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_6, content_type: /\Aimage\/.*\Z/

  has_attached_file :photo_7, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_7, content_type: /\Aimage\/.*\Z/


  def check_state_des
    ret = ""
    ret = "草稿(未审批)" if check_state.eql?("draft")
    ret = "通过" if check_state.eql?("confirmed")
    ret = "不通过" if check_state.eql?("rejected")
    ret
  end
end
