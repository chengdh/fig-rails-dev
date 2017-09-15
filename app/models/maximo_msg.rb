#coding: utf-8
require 'json'
class MaximoMsg < ActiveRecord::Base
  self.primary_key = "orderid"
  #将数据对象转换为hash
  def order_detail_hash
    hs = JSON.parse(form).try(:first)
    new_hash = {}
    hs.each_pair do |k,v|
      new_hash.merge!({k.downcase => v})
    end
    new_hash
  end

  #未读数据
  def self.unread_bills(orderuserid,ordertable=nil)
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

  #审批
  def self.task_appro_val(appro,assignid,ispositive,evaluate_caluse,evaluate)
    resp = MaximoApproValSoap.task_appro_val(appro,assignid,ispositive,evaluate_caluse,evaluate)
    {x_ret_code: resp.body[:task_appro_val_response][:return]}
  end
end
