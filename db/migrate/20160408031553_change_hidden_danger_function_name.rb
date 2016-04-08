#coding: utf-8
#修改名称
class ChangeHiddenDangerFunctionName < ActiveRecord::Migration
  def change
    sf_name = "事故隐患整改"
    sf = SystemFunction.find_by(name: sf_name)
    sf.update_attributes(name: "隐患整改") if sf.present?

    sf_name = "事故隐患整改处理"
    sf = SystemFunction.find_by(name: sf_name)
    sf.update_attributes(name: "隐患管理审批") if sf.present?


  end
end
