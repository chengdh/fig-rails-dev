#coding: utf-8
#用户-机构
class UserOrg < ActiveRecord::Base
  belongs_to :user
  belongs_to :org
  validates :org_id, presence: true

  default_scope -> {includes(:org)}
end
