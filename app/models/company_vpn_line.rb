#coding: utf-8
class CompanyVpnLine < ActiveRecord::Base
  belongs_to :company_vpn
  belongs_to :own_org,class_name: "Org"
  validates :username,:employee_name, presence: true
end
