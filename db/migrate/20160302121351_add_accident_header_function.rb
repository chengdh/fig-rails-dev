#coding: utf-8
class AddAccidentHeaderFunction < ActiveRecord::Migration
  def change
    group_name = "安保-动态情况管理"
    sf_name = "事故报告管理"
    subject = "AccidentHeader"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'accident_headers_path',
      function: {
        create: {name: "新建"},
        update: {name: "修改"},
        destroy: {name:"删除"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)



  end
end
