#coding: utf-8
class AddTransformerFunction < ActiveRecord::Migration
  def change
    group_name = "安保-基础信息设置"
    sf_name = "电气设备-变压器"
    subject = "Transformer"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'transformers_path',
      function: {
        create: {name: "新建"},
        update: {name: "修改"},
        destroy: {name:"删除"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)


  end
end
