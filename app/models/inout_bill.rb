#coding: utf-8
class InoutBill < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  belongs_to :f_location,class_name: "Location"
  belongs_to :t_location,class_name: "Location"
  has_many :inout_lines,dependent: :destroy
  accepts_nested_attributes_for :inout_lines,reject_if: proc { |attributes| attributes['equipment_id'].blank? },allow_destroy: true
  validates :bill_date,:org_id,:f_location_id,:t_location_id, presence: true


  state_machine :initial => :draft do
    after_transition :draft => :confirmed do |bill, transition|
      bill.inout_lines.each {|l| l.confirm!}
    end
    event :confirm do
      transition :draft => :confirmed
    end
  end
end
