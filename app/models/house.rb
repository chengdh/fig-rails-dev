#coding: utf-8
#房舍及院落
class House < ActiveRecord::Base
  belongs_to :org
  validates :org_id,:name, presence: true
  default_scope {order("org_id")}
end
