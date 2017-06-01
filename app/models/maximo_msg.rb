#coding: utf-8
require 'json'
class MaximoMsg < ActiveRecord::Base
  #将数据对象转换为hash
  def order_detail_hash
    JSON.parse(form).try(:first)
  end

  #未读数据
  def self.unread_bills(orderuserid,ordertable)
    where(orderuserid: orderuserid,ordertable: ordertable).to_json
  end

  #从maximo系统中同步数据
  def self.sync_with_maximo(username)
    MaximoSoap.sync_table(MaximoMsg,username,0,9999)
  end
end
