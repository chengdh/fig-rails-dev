#coding: utf-8
#修改删除功能为无条件删除
class ChangeHiddenDangerFunction < ActiveRecord::Migration
  def change
    sf = SystemFunction.find_by(name: "事故隐患整改处理")
    sfo = sf.system_function_operates.find_by(name: "删除")
    if sfo.present?
      function_obj = {subject: "HiddenDanger",action: :destroy}
      sfo.update_attributes(function_obj: function_obj)
    end
  end
end
