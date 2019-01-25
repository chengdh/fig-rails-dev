#coding: utf-8
module CuxPmPreProjectsHelper
  #获取项目基本信息描述
  def option_des(class_category,class_code)
    ret =""
    PaClassCode.where(class_category: class_category,class_code: class_code).try(:first).try(:description)
  end
end
