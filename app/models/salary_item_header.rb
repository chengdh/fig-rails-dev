#coding: utf-8
#工资项目表头
class SalaryItemHeader < ActiveRecord::Base

  #县局 领导 在岗 内退  劳务
  CODE_XIAN_LEADER = "xian_leader"
  CODE_XIAN_ON_DUTY = "xian_on_duty"
  CODE_XIAN_RETIRED = "xian_retired"
  CODE_XIAN_NON_STAFF = "xian_non_staff"

  #市局 领导 在岗 内退  劳务
  CODE_SHI_LEADER = "shi_leader"
  CODE_SHI_ON_DUTY = "shi_on_duty"
  CODE_SHI_RETIRED = "shi_retired"
  CODE_SHI_NON_STAFF = "shi_non_staff"

  belongs_to :org
  validates :name, presence: true
  has_many :salary_items,dependent: :destroy
  accepts_nested_attributes_for :salary_items
  serialize :employee_where
  default_scope {includes(:salary_items)}
end
