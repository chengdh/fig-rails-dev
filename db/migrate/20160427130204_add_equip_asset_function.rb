#coding: utf-8
class AddEquipAssetFunction < ActiveRecord::Migration
  def change
    group_name = "信息-固定资产管理"
    sf_name = "固定资产资料"
    subject = "EquipAsset"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'equip_assets_path',
      function: {
        read: {name: "查看"},
        create: {name: "新建"},
        update: {name: "修改"},
        destroy: {name:"删除"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
