#coding: utf-8
#计量单位
class Unit < ActiveRecord::Base
  default_scope {order("order_by ASC")}
  validates :name, presence: true

  def to_s
    name
  end
end
