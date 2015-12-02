#coding: utf-8
#大小球数据
class OddsBall < ActiveRecord::Base
  belongs_to :match
  belongs_to :company
end
