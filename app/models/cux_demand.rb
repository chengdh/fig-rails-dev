#coding: utf-8
class CuxDemand < ActiveRecord::Base
  self.table_name = "cux_demand_platform_headers_a"
  has_many :cux_demand_lines
  scope :bills_by_wf_itemkeys,-> (wf_itemkeys) {where(wf_itemkey: wf_itemkeys).includes(:cux_demand_lines)}

  def self.unread_bills(wf_itemkeys)
    self.bills_by_wf_itemkeys(wf_itemkeys).to_json(include: :cux_demand_lines)
  end
end
