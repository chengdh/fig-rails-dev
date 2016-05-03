#coding: utf-8
class AddWorthlessBillAssetFunction < ActiveRecord::Migration
  def change
    group_name = "信息-固定资产管理"
    sf_name = "固定资产-报废单"
    subject = "WorthlessBillAsset"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'worthless_bill_assets_path("q[state_eq]" => "draft")',
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
