#coding: utf-8
#消防设施
class FireFightingEquipment < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  validates :name,:org_id, presence: true
  default_scope {order("org_id DESC")}
end
