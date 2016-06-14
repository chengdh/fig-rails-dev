#coding: utf-8
class AddSubmitFunctionToIpInfoHeader < ActiveRecord::Migration
  def change
    sf = SystemFunction.find_by(name: "IP地址管理")
    update_attrs = {
      subject: "IpInfoHeader",
      function: {
        submit: {name: "上报",conditions: {check_state: ["draft","rejected"]}}
      }
    }
    sf.update_by_hash(update_attrs) if sf.present?
  end
end
