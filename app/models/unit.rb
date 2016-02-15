#coding: utf-8
#计量单位
class Unit < ActiveRecord::Base
  validates :name, presence: true
end
