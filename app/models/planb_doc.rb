#coding: utf-8
#应急预案演练
class PlanbDoc < ActiveRecord::Base
  include ModelStateMachine
  belongs_to :org
  belongs_to :user
  belongs_to :checker,class_name: "User"
  belongs_to :submitter,class_name: "User"

  validates :plan_length,:join_count,numericality: {only_integer: true, greater_than: 0}

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
    # :audit_item_1_state,:audit_item_2_state,:audit_item_3_state,:audit_item_4_state,
    # :audit_item_5_state,:audit_item_6_state,:audit_item_7_state,
    :note,:check_leader, presence: true
  validates :plan_length,:join_count, numericality: true
  validates :plan_content,:plan_process, length: { in: 30..2000 }

  #至少要有一张照片
  validate :must_less_than_one_photo

  #待审批
  scope :waitting_confirm,->(org_ids){ where(check_state: "submitted",org_id: org_ids)}
  #待修改
  scope :rejected,->(org_id){ where(check_state: "rejected",org_id: org_id)}


  default_value_for :table_date do
    Date.today
  end
  default_value_for :plan_date do
    Date.today
  end
  default_value_for :plan_length do
    1
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

  private
  def must_less_than_one_photo
    errors.add(:photo,"至少需要上传一张照片!") if photo_1.blank? and photo_2.blank? and photo_3.blank? and photo_4.blank? and photo_5.blank? and photo_6.blank? and photo_7.blank?
  end

end
