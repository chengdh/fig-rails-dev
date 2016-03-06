#coding: utf-8
#工资项目
class SalaryItem < ActiveRecord::Base
  validates :name,:code,:salary_item_header_id, presence: true
  belongs_to :salary_item_header
  default_scope {order("order_by ASC")}
end
