#coding: utf-8
#组织机构
class Org < ActiveRecord::Base
  validates :name, presence: true
  acts_as_tree order: "order_by"

  def to_s
    name
  end
end
