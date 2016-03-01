#coding: utf-8
class SafetyTable < ActiveRecord::Base
  validates :org_id,:mth, presence: true
  belongs_to :org
  belongs_to :user

  #整改率
  def fixed_danger_rate
    (fixed_danger_count.to_f/danger_count.to_f).round(3)*100
  end

  #安保总投入
  def sum_invest
    invest_equipment_money + invest_faclities_money + fixed_danger_money + safety_edu_money + safety_reward_money
  end

  def sum_safety_check_count
    safety_check_count+special_safety_check_count + evening_safety_check_count 
  end
end
