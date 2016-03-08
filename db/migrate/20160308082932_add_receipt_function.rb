#coding: utf-8
#采购入库单
class AddReceiptFunction < ActiveRecord::Migration
  def change
    group_name = "设备管理"
    sf_name = "设备采购入库"
    subject = "Receipt"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'receipts_path("q[state_eq]" => "draft")',
      function: {
        read: {name: "查看"},
        create: {name: "新建"},
        update: {name: "修改",conditions: {:state => "draft"}},
        destroy: {name:"删除",conditions: {:state => "draft"}},
        confirm: {name: "确认完成",conditions: {:state => "draft"}}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
