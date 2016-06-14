#coding: utf-8
class VpnInfo < ActiveRecord::Base
  include ModelStateMachine
  belongs_to :org
  belongs_to :user
  validates :org_id, presence: true
  has_many :vpn_info_lines
  belongs_to :checker,class_name: "User"
  belongs_to :submitter,class_name: "User"

  default_scope {order("table_date DESC")}
  accepts_nested_attributes_for :vpn_info_lines,
    reject_if: proc { |attrs| attrs['username'].blank? or attrs['pwd'].blank? or attrs['employee_name'].blank?} ,
    allow_destroy: true

  default_value_for :check_state,"draft"
  default_value_for :table_date do
    Date.today
  end
end
