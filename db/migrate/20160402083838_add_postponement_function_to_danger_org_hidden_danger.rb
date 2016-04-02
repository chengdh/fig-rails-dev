#coding: utf-8
class AddPostponementFunctionToDangerOrgHiddenDanger < ActiveRecord::Migration
  def change
    sf = SystemFunction.find_by(name: "事故隐患整改")
    exist = sf.system_function_operates.exists?(name: "延期操作")
    if not exist
      function_obj = {subject: "HiddenDanger",action: :postponement,conditions: {postponement_days: 0,fixed_state: ["deliveried","processing"],review_state: "draft"}}
      sf.system_function_operates.create(name: "延期操作",function_obj: function_obj)
    end
  end
end
