#coding: utf-8
class Driver < ActiveRecord::Base
  validates :org_id,:name, presence: true
  belongs_to :org
  belongs_to :vehicle
end
