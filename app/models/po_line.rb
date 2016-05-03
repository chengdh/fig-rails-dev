#coding: utf-8
class PoLine < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :base_purchase_order

  state_machine :initial => :draft do
    event :confirm do
      transition :draft => :confirmed
    end
  end
  default_value_for :price,0
  default_value_for :qty,1
  default_value_for :state,"draft"

  #合计金额
  def amt
    price.to_f*qty.to_f
  end
  def state_des
    ret = ""
    ret = "进行中" if state.eql?("processing")
    ret = "已完成" if state.eql?("confirmed")
    ret
  end
end
