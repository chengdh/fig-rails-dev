#coding: utf-8
class BasePurchaseOrder < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  belongs_to :confirmer,class_name: "User"
  belongs_to :f_location,class_name: "Location"
  belongs_to :t_location,class_name: "Location"
  has_many :po_lines,dependent: :destroy
  has_one :inout_bill,foreign_key: "ref_po_id"
  accepts_nested_attributes_for :po_lines,reject_if: proc { |attributes| attributes['equipment_id'].blank? },allow_destroy: true
  validates :bill_date,:org_id,:f_location_id,:t_location_id, presence: true

  default_value_for :state,"draft"

  default_value_for(:bill_date) {Date.today}
  state_machine :initial => :draft do
    after_transition :draft => :confirmed do |bill, transition|
      bill.po_lines.each {|l| l.confirm!}
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
  #由采购订单生成草稿入库单
  def build_receipt(resource_class)
    po_attrs = attributes.except("id","created_at","bill_date","updated_at","type","state","confirmer_id","confirm_date","operator")
    po_attrs['name'] = "自[#{po_attrs['name']}自动生成]"
    receipt = resource_class.new(po_attrs)
    receipt.base_purchase_order = self
    self.po_lines.each do |po_line|
      receipt_line_attrs = po_line.attributes.except("id","state","base_purchase_order_id","created_at","updated_at")
      receipt_line_attrs["f_location_id"] = self.f_location_id
      receipt_line_attrs["t_location_id"] = self.t_location_id
      receipt.inout_lines.build(receipt_line_attrs)
    end
    receipt
  end
end
