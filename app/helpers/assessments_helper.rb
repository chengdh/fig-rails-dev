#coding: utf-8
module AssessmentsHelper
  #得分描述
  def marks_des(marks)
    ret = "无"
    ret = "不符合" if marks < 0
    ret
  end
end
