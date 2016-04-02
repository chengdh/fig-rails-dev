#coding: utf-8
class ChangePostponementFunction < ActiveRecord::Migration
  def change
    sf = SystemFunction.find_by(name: "事故隐患整改")
    sfo = sf.system_function_operates.find_by(name: "延期操作")
    if sfo.present?
      function_obj = {subject: "HiddenDanger",action: :postponement,conditions: {postponement_days: 0,fixed_state: ["deliveried","processing"],review_state: "draft"}}
      sfo.update_attributes(function_obj: function_obj)
    end
  end
end
