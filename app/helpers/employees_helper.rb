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
    [["领导",1],["正科",2],["正协",3],["副科",4],["副协",5],["一般人员",9]]
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
end
