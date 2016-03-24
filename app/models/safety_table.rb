#coding: utf-8
class SafetyTable < ActiveRecord::Base
  validates :org_id,:mth, presence: true
  belongs_to :org
  belongs_to :user

  #整改率
  def fixed_danger_rate
    return 0 if danger_count.to_f == 0
    (fixed_danger_count.to_f/danger_count.to_f).round(3)*100
  end

  #安保总投入
  def sum_invest
    invest_equipment_money.to_i + invest_faclities_money.to_i + fixed_danger_money.to_i + safety_edu_money.to_i + safety_reward_money.to_i
  end

  def sum_safety_check_count
    safety_check_count.to_i+special_safety_check_count.to_i + evening_safety_check_count.to_i
  end
end
