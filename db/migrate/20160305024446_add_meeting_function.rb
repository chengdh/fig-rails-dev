#coding: utf-8
class AddMeetingFunction < ActiveRecord::Migration
  def change
    group_name = "安保-动态情况管理"
    sf_name = "会议记录"
    subject = "Meeting"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'meetings_path',
      function: {
        read: {name: "查看"},
        create: {name: "新建"},
        update: {name: "修改",conditions: {:check_state => ["draft","rejected"]}},
        destroy: {name:"删除",conditions: {:check_state => ["draft","rejected"]}}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
