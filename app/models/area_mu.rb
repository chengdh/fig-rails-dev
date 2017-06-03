#coding: utf-8
class AreaMu < ActiveRecord::Base
  belongs_to :area_info
  validates :mu_result,:mu_percent, numericality: true
  default_scope -> {order("area_info_id,submit_date DESC ")}

  default_value_for :submit_date,Date.today
  def area_info_name
    area_info.name
  end
end
