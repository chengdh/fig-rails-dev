#coding: utf-8
module CuxPmPreProjectsHelper
  #获取项目基本信息描述
  def option_des(class_code)
    ret =""
    PaClassCode.find(class_code: class_code).try(:description)
  end
end
