#coding: utf-8
#组织机构
class Org < ActiveRecord::Base
  validates :name, presence: true
  acts_as_tree order: "order_by"
  has_many :warehouses

  def to_s
    name
  end
end
