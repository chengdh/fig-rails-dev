#coding: utf-8
#会议记录
class Meeting < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  belongs_to :checker,class_name: "User"

  default_scope {order("meeting_date DESC")}
  default_value_for(:table_date) {Date.today}
  default_value_for(:meeting_date) {Date.today}

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



  validates :org_id,:user_id,:name,:meeting_date,:meeting_length,:presenter,
    :join_persons,:join_count,:meeting_content,:check_state, presence: true
  validates :meeting_length,:join_count, numericality: true
  def check_state_des
    ret = ""
    ret = "草稿(未审批)" if check_state.eql?("draft")
    ret = "通过" if check_state.eql?("confirmed")
    ret = "不通过" if check_state.eql?("rejected")
    ret
  end

end