#coding: utf-8
class VpnInfoLine < ActiveRecord::Base
  belongs_to :vpn_info
  belongs_to :own_org,class_name: "Org"
  validates :username,:pwd,:employee_name, presence: true
end
