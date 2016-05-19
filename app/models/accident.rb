#coding: utf-8
#事故月报
class Accident < ActiveRecord::Base
  belongs_to :accident_type
  validates :accident_type_id, presence: true

  validates :industry_accident_count,:industry_die_persons,:industry_wounded_persons,
    :industry_economic_losses,numericality: {only_integer: true }

  validates :commerical_accident_count,:commerical_die_persons,:commerical_wounded_persons,
    :commerical_economic_losses,numericality: {only_integer: true, greater_than_or_equal_to: 0}

  end
