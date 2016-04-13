#coding: utf-8
class ChangeMeetingFunction < ActiveRecord::Migration
  def change
    sf = SystemFunction.find_by(name: "会议记录")
    update_attrs = {
      subject: "Meeting",
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
