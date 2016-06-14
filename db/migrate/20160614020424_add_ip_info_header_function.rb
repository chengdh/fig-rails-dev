#coding: utf-8
class AddIpInfoHeaderFunction < ActiveRecord::Migration
  def change
    group_name = "信息-IP及VPN管理"
    sf_name = "IP地址管理"
    subject = "IpInfoHeader"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'ip_info_headers_path',
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
