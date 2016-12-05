#coding: utf-8
#设备资料
class Equipment < ActiveRecord::Base
  belongs_to :equipment_category
  belongs_to :unit
  validates :name,:equipment_category_id,:unit_id, presence: true
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  default_scope -> {order("order_by ASC")}
end
