#coding: utf-8
#工资项目表头
class SalaryItemHeader < ActiveRecord::Base
  belongs_to :org
  validates :name, presence: true
  has_many :salary_items,dependent: :destroy
  accepts_nested_attributes_for :salary_items
end
