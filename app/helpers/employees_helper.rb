#coding: utf-8
module EmployeesHelper
  #性别
  def genders_for_select
    [['男','m'],['女','f']]
  end

  #性别描述
  def gender_des(gender_code)
    ret = ""
    ret = "男" if gender_code.eql?("m")
    ret = "女" if gender_code.eql?("f")
    ret
  end

  #职级选择
  def post_levels_for_select
    [["一般人员",9],["正科",2],["正协",3],["副科",4],["副协",5],["正股",6],["副股",7],["领导",1]]
  end

  #工作状态选择
  def work_states_for_select
    [["在岗","on_duty"],["内退","retired"],["编外离岗","non_staff"]]
  end

  #所属支部选择
  def parties_for_select
    [["一支部",'party_1'],["二支部",'party_2'],["三支部","party_3"]]
  end

  #当前可用的人员信息
  def current_ability_org_employees_for_select
    Employee.where(is_active: true,org_id: current_ability_org_ids).map {|e| [e.name,e.id]}
  end

  def party_des(party)
    ret = ""
    ret = "一支部" if party.eql?('party_1')
    ret = "二支部" if party.eql?('party_2')
    ret = "三支部" if party.eql?('party_3')
    ret
  end

  def post_level_des(post_level)
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
  def work_state_des(work_state)
    ret = ""
    ret = "在岗" if work_state.eql?("on_duty")
    ret = "内退" if work_state.eql?("retired")
    ret = "编外离岗" if work_state.eql?("non_staff")
    ret
  end
  def is_not_main_des(is_not_main)
    ret = ""
    ret = "三产" if is_not_main
    ret = "在册" unless is_not_main
    ret
  end
  def is_party_member_des(is_party_member)
    ret = ""
    ret = "是" if is_party_member
    ret = "否" unless is_party_member
    ret
  end
end
