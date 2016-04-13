#coding: utf-8
class ChangePlanbFunction < ActiveRecord::Migration
  def change
    sf = SystemFunction.find_by(name: "应急预案演练信息录入")
    update_attrs = {
      subject: "PlanbDoc",
      function: {
        read: {name: "查看"},
        create: {name: "新建"},
        update: {name: "修改",conditions: {check_state: ["draft","rejected"]}},
        destroy: {name: "删除",conditions: {check_state: ["draft"]}},
        submit: {name: "上报",conditions: {check_state: ["draft","rejected"]}}
      }
    }
    sf.update_by_hash(update_attrs) if sf.present?
 
  end
end
