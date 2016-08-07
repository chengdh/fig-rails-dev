#coding: utf-8
class WifiClientLine < ActiveRecord::Base
  belongs_to :wifi_client
  belongs_to :own_org,class_name: "Org"
  validates :username,:mac, presence: true
end
