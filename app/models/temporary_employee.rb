#coding: utf-8
#相关方人员管理
class TemporaryEmployee < ActiveRecord::Base
  validates :org_id,:name, presence: true
  belongs_to :org
  belongs_to :manage_org,class_name: "Org"
  default_scope {order("org_id")}
end
