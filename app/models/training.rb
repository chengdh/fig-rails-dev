#coding: utf-8
#培训管理
class Training < ActiveRecord::Base
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

  validates :org_id,:table_date,:user_id,:name,:training_date,:teachers,:training_length,:join_persons,:join_count,:training_content,:assess_type, presence: true
  default_value_for :table_date do
    Date.today
  end
  default_value_for :training_date do
    Date.today
  end

  def assess_type_des
    ret = ""
    ret = "测试" if assess_type.eql?("test")
    ret = "提问" if assess_type.eql?("question")
    ret = "座谈" if assess_type.eql?("conversion")
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
