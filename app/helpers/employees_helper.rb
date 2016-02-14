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

end
