#coding: utf-8
#用户付费记录
class Payment < ActiveRecord::Base
  belongs_to :user,foreign_key: :cbi

  #支付完成时间
  def complete_time
    Time.at(ct/1000)
  end

  #支付时间
  def payment_time
    Time.at(pt/1000)
  end
end
