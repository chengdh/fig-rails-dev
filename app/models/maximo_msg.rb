#coding: utf-8
require 'json'
class MaximoMsg < ActiveRecord::Base
  #将数据对象转换为hash
  def order_detail_hash
    JSON.parse(form).try(:first)
  end

  #未读数据
  def self.unread_bills(orderuserid,ordertable)
    ret = nil
    if ordertable.present?
      ret = where(orderuserid: orderuserid,ordertable: ordertable).to_json
    else
      ret = where(orderuserid: orderuserid).to_json
    end
    ret
  end

  #从maximo系统中同步数据
  def self.sync_with_maximo(username)
    MaximoSoap.sync_table(MaximoMsg,username,0,9999)
  end
end
