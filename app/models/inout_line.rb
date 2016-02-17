#coding: utf-8
#出入库明细
class InoutLine < ActiveRecord::Base
  belongs_to :inout_bill,polymorphic: true,required: true
  state_machine :initial => :draft do
    event :confirm do
      transition :draft => :confirmed
    end
  end

  #合计金额
  def amt
    price*qty
  end
end
