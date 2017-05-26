#coding: utf-8
require 'json'
class MaximoMsg < ActiveRecord::Base
  #将数据对象转换为hash
  def order_detail_hash
    JSON.parse(orderjson)
  end

  #未读数据
  def self.unread_bills(order_userid)
    where(orderuserid: order_userid).to_json
  end
end
