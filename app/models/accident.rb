#coding: utf-8
#事故月报
class Accident < ActiveRecord::Base
  belongs_to :accident_type
  validates :accident_type_id, presence: true
end
