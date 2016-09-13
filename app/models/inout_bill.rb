#coding: utf-8
#出入库单据
class InoutBill < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  belongs_to :confirmer,class_name: "User"
  belongs_to :f_location,class_name: "Location"
  belongs_to :t_location,class_name: "Location"
  belongs_to :base_purchase_order,foreign_key: "ref_po_id"
  has_many :inout_lines,dependent: :destroy
  accepts_nested_attributes_for :inout_lines,reject_if: proc { |attributes| attributes['equipment_id'].blank? },allow_destroy: true
  validates :bill_date,:org_id,:f_location_id,:t_location_id, presence: true

  default_value_for :state,"draft"

  default_value_for(:bill_date) {Date.today}
  state_machine :initial => :draft do
    after_transition :draft => :confirmed do |bill, transition|
      bill.inout_lines.each {|l| l.confirm!}
    end
    event :confirm do
      transition :draft => :confirmed
    end
  end
  def state_des
    ret = ""
    ret = "草稿" if state.eql?("draft")
    ret = "进行中" if state.eql?("processing")
    ret = "已完成" if state.eql?("confirmed")
    ret
  end
end