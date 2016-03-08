#coding: utf-8
#出入库明细
class InoutLine < ActiveRecord::Base
  belongs_to :inout_bill,polymorphic: true
  belongs_to :f_location,class_name: "Location"
  belongs_to :t_location,class_name: "Location"
  belongs_to :equipment
  state_machine :initial => :draft do
    event :confirm do
      transition :draft => :confirmed
    end
  end
  default_value_for :price,0.0
  default_value_for :qty,1
  default_value_for :state,"draft"

  #合计金额
  def amt
    price*qty
  end
end
