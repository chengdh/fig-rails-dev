#coding: utf-8
class ChangeReviewFunctionToHiddenDanger < ActiveRecord::Migration
  def change
    sf = SystemFunction.find_by(name: "事故隐患整改处理")
    sfo = sf.system_function_operates.find_by(name: "复查")
    if sfo.present?
      function_obj = {subject: "HiddenDanger",action: :review,conditions: {fixed_state: ["fixed","processing"],review_state: "draft"}}
      sfo.update_attributes(function_obj: function_obj)
    end
  end
end
