#coding: utf-8
require 'json'
class MaximoMsg < SecondBase::Base
  self.primary_key = "orderid"
  #将数据对象转换为hash
  def order_detail_hash
    hs = JSON.parse(form).try(:first)
    new_hash = {}
    hs.each_pair do |k,v|
      new_hash.merge!({k.downcase => v})
    end if hs.present?
    new_hash
  end

  #未读数据
  #orderuserid : 登录用户名 工号
  def self.unread_bills(orderuserid,ordertable=nil)
    ret = nil
    sync_with_maximo(orseruserid)
    if ordertable.present?
      ret = where(orderuserid: orderuserid,ordertable: ordertable,processed: false).to_json
    else
      ret = where(orderuserid: orderuserid,processed: false).to_json
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
    ret_code = resp.body[:task_appro_val_response][:return].to_i
    #更新记录状态
    max_msg = MaximoMsg.where(ordertaskid: assignid).first
    max_msg.update_attributes(processed: true) if max_msg.present? and  ret_code == 0

    {x_ret_code: resp.body[:task_appro_val_response][:return]}
  end
end
