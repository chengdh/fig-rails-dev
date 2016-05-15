#coding: utf-8
#会议记录
class Meeting < ActiveRecord::Base
  include ModelStateMachine
  belongs_to :org
  belongs_to :user
  belongs_to :checker,class_name: "User"

  default_scope {order("meeting_date DESC")}


  validates :meeting_length,:join_persons,:join_count,numericality: {only_integer: true, greater_than: 0}
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


 
  validates :meeting_content,length: { in: 50..2000 }
  validates :org_id,:user_id,:name,:meeting_date,:meeting_length,:presenter,
    :join_persons,:join_count,:meeting_content,:check_state, presence: true
  validates :meeting_length,:join_count, numericality: true

  #待审批
  scope :waitting_confirm,->(org_ids){ where(check_state: "draft",org_id: org_ids)}
  #待修改
  scope :rejected,->(org_id){ where(check_state: "rejected",org_id: org_id)}

end
