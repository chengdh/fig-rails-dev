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
  #三级教育比例
  def self.third_edu_percent(q)
    ret = 0
    if q.result.count() > 0
      ret = q.result.sum("third_edu_persons") / q.result.sum("third_edu_persons/(third_edu_percent/100)")*100
    end
    ret.round(2)
  end
  #特种教育比例
  def self.special_worker_edu_percent(q)
    ret = 0
    if q.result.count() > 0
      ret = q.result.sum("special_worker_edu_persons") / q.result.sum("special_worker_edu_persons/(special_worker_edu_percent/100)")*100
    end
    ret.round(2)
  end
  #全员教育比例
  def self.common_edu_percent(q)
    ret = 0
    if q.result.count() > 0
      ret = q.result.sum("common_edu_persons") / q.result.sum("common_edu_persons/(common_edu_percent/100)")*100
    end
    ret.round(2)
  end


end
