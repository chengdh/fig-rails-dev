#coding: utf-8
class SafetyTable < ActiveRecord::Base
  include ModelStateMachine
  validates :org_id,:mth, presence: true
  belongs_to :org
  belongs_to :user
  belongs_to :checker,class_name: "User"
  belongs_to :submitter,class_name: "User"
  default_scope {order("mth DESC,table_date ASC")}

  validates :safety_check_count,:special_safety_check_count,:evening_safety_check_count,
    :danger_count,:fixed_danger_count,:third_edu_persons,:special_worker_edu_persons,:common_edu_persons,
    :no_duplicate_persons,:safety_meeting_count,:safety_meeting_persons,:safety_meeting_solve_questions,
    numericality: {only_integer: true, greater_than_or_equal_to: 0}

  validates  :third_edu_percent,:special_worker_edu_percent,:common_edu_percent,
    :invest_equipment_money,:invest_faclities_money,:fixed_danger_money,:safety_edu_money,:safety_reward_money,
    numericality: {greater_than_or_equal_to: 0}


  validates :third_edu_percent,:special_worker_edu_percent,:common_edu_percent,
    :invest_equipment_money,:invest_faclities_money,:fixed_danger_money,
    :safety_edu_money,:safety_reward_money,
    numericality: true

  default_value_for :special_worker_edu_percent,0.0
  default_value_for :third_edu_percent,0.0
  default_value_for :common_edu_percent,0.0
  default_value_for :invest_equipment_money,0.0
  default_value_for :invest_faclities_money,0.0
  default_value_for :fixed_danger_money,0.0
  default_value_for :safety_edu_money,0.0
  default_value_for :safety_reward_money,0.0
  #待审批
  scope :waitting_confirm,->(org_ids){ where(check_state: "submitted",org_id: org_ids)}
  #待修改
  scope :rejected,->(org_id){ where(check_state: "rejected",org_id: org_id)}

  #默认月份
  #本月26日之后填写,月份是当月
  #下月3日之前填写,月份是上月
  default_value_for :mth do
    default_mth
  end
  default_value_for :table_date do
    Date.today
  end

  #判断是否在录入时间段内当月26至次月3日前
  def self.in_upload_period?
    Date.today.day >= 16 or Date.today.day <= 3
    return true
  end

  #获取数据录入月份
  def self.default_mth
    ret = ""
    ret = Date.today.strftime("%Y%m") if Date.today.day >= 16
    ret = 1.months.ago.strftime("%Y%m") if  Date.today.day <= 7
    ret
  end
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
    sum =  q.result.sum("third_edu_persons/(third_edu_percent/100)")
    return 0 if sum == 0
    ret = q.result.sum("third_edu_persons") / sum * 100
    ret.round(2)
  end
  #特种教育比例
  def self.special_worker_edu_percent(q)
    ret = 0
    sum = q.result.sum("special_worker_edu_persons/(special_worker_edu_percent/100)")
    return 0 if sum == 0
    ret = q.result.sum("special_worker_edu_persons").to_f / sum * 100
    ret.round(2)
  end
  #全员教育比例
  def self.common_edu_percent(q)
    ret = 0
    sum = q.result.sum("common_edu_persons/(common_edu_percent/100)")
    return 0 if sum == 0

    ret = q.result.sum("common_edu_persons").to_f / sum *100
    ret.round(2)
  end
  #隐患整改比例
  def self.fixed_danger_percent(q)
    ret = 0
    sum = q.result.sum("danger_count")
    return 0 if sum == 0
    ret = q.result.sum("fixed_danger_count").to_f/sum*100
    ret.round(2)
  end
end
