#coding: utf-8
class SalaryTableLine < ActiveRecord::Base
  belongs_to :salary_table
  belongs_to :org
  belongs_to :employee
  validates :employee_id, presence: true
  validates :pay_item_1,:pay_item_2,:pay_item_3,:pay_item_4,:pay_item_5,:pay_item_6,:pay_item_7,:pay_item_8,:pay_item_9,:pay_item_10,:pay_item_11,:pay_item_12,:pay_item_13,
    :pay_item_14,:pay_item_15,:pay_item_16,:pay_item_17,:pay_item_18,:pay_item_19,:pay_item_20,:pay_item_21,:pay_item_22,:pay_item_23,:pay_item_24,:pay_item_25,:pay_item_26,
    :pay_item_27,:pay_item_28,:pay_item_29,:pay_item_30,:pay_item_31,:pay_item_32,:pay_item_33,:pay_item_34,:pay_item_35,:pay_item_36,:pay_item_37,:pay_item_38,:pay_item_39,
    :deduct_item_1,:deduct_item_2,:deduct_item_3,:deduct_item_4,:deduct_item_5,:deduct_item_6,:deduct_item_7,:deduct_item_8,:deduct_item_9,:deduct_item_10,:deduct_item_11,:deduct_item_12,:deduct_item_13,
    :deduct_item_14,:deduct_item_15,:deduct_item_16,:deduct_item_17,:deduct_item_18,:deduct_item_19,:deduct_item_20,:deduct_item_21,:deduct_item_22,:deduct_item_23,:deduct_item_24,:deduct_item_25,:deduct_item_26,
    :deduct_item_27,:deduct_item_28,:deduct_item_29,:deduct_item_30,:deduct_item_31,:deduct_item_32,:deduct_item_33,:deduct_item_34,:deduct_item_35,:deduct_item_36,:deduct_item_37,:deduct_item_38,:deduct_item_39,
    numericality: {greater_than_or_equal_to: 0}

  def work_state_des
    ret = ""
    ret = "在岗" if work_state.eql?("on_duty")
    ret = "内退" if work_state.eql?("retired")
    ret = "编外离岗" if work_state.eql?("non_staff")
    ret
  end
  def post_level_des
    ret = ""
    ret = "领导" if post_level == 1
    ret = "正科" if post_level == 2
    ret = "正协" if post_level == 3
    ret = "副科" if post_level == 4
    ret = "副协" if post_level == 5
    ret = "正股" if post_level == 6
    ret = "副股" if post_level == 7
    ret = "一般人员" if post_level == 9
    ret
  end
  def belongs_party_des
    ret = ""
    ret = "一支部" if belongs_party.eql?('party_1')
    ret = "二支部" if belongs_party.eql?('party_2')
    ret = "三支部" if belongs_party.eql?("party_3")
    ret
  end
  def is_not_main_des
    ret = ""
    ret = "三产" if is_not_main
    ret = "在册" unless is_not_main
    ret
  end

  def is_party_member_des
    ret = ""
    ret = "是" if is_party_member
    ret = "否" unless is_party_member
    ret
  end
end
