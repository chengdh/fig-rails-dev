#coding: utf-8
class AddPlanbDocFunction < ActiveRecord::Migration
  def change
    group_name = "安保-动态情况管理"
    sf_name = "应急预案演练信息录入"
    subject = "PlanbDoc"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'planb_docs_path',
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
