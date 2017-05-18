#coding: utf-8
class AreaInfo < ActiveRecord::Base
  validates :code, presence: true
  validates :total_area, numericality: true
  has_many :area_mus
  def name
    ret = ""
    ret = ChinaCity.get(code)
    ret += ">#{ChinaCity.get(city_code)}" if city_code.present?
    ret += ">#{ChinaCity.get(district_code)}" if district_code.present?
    ret
  end

  #total areas
  def self.total_area(q_params)
    area_info = self.ransack(q_params).result.try(:first).try(:total_area)
  end

  #已完成的收割亩数
  def self.finished_mus(q_params)
    area_info = self.ransack(q_params).result.try(:first)
    sum_mus = area_info.try(:area_mus).try(:sum,:mu_result)
  end
  def self.last_percent(q_params)
    area_info = self.ransack(q_params).result.try(:first)
    last_percent = area_info.try(:area_mus).try(:order,"submit_date DESC ").try(:first).try(:mu_percent)
  end

end
