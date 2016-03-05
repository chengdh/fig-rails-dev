#coding: utf-8
#应急预案演练
class PlanbDoc < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  belongs_to :checker,class_name: "User"
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


  validates :org_id,:user_id,:name,:plan_date,:plan_length,:plan_type,:join_persons,:join_count,
    :plan_content,:plan_process,:document_name,:audit_date,:audit_persons,
    :audit_item_1_state,:audit_item_2_state,:audit_item_3_state,:audit_item_4_state,
    :audit_item_4_state,:audit_item_5_state,:audit_item_6_state,:audit_item_7_state,:note,:check_leader, presence: true
  validates :plan_length,:join_count, numericality: true

  default_value_for :table_date do
    Date.today
  end
  default_value_for :plan_date do
    Date.today
  end
  default_value_for :audit_date do
    Date.today
  end
  default_value_for :check_date do
    Date.today
  end
  def plan_type_des
    ret = ""
    ret = "桌面演练" if plan_type.eql?("sim")
    ret = "现场演练" if plan_type.eql?("act")
    ret
  end
  def check_state_des
    ret = ""
    ret = "草稿(未审批)" if check_state.eql?("draft")
    ret = "通过" if check_state.eql?("confirmed")
    ret = "不通过" if check_state.eql?("rejected")
    ret
  end

end