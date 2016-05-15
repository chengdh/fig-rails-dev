#coding: utf-8
#劳动防护用品
class ProtectEquipment < ActiveRecord::Base
  belongs_to :protect_equipment_category
  belongs_to :org
  belongs_to :unit
  belongs_to :deliver_org,class_name: "Org"
  validates :protect_equipment_category_id,:org_id,:name, presence: true

  validates :qty,:save_days,:maintain_days, numericality: {only_integer: true, greater_than: 0}
  default_scope {order("org_id,protect_equipment_category_id")}
end
