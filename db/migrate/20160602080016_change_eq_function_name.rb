#coding: utf-8
#备品备件-领用单 与 备品备件-调拨单 名称错误 调换一下
class ChangeEqFunctionName < ActiveRecord::Migration
  def change
    sf_name_1 = "备品备件-调拨单"
    sf_name_2 = "备品备件-领用单"
    sf_1 = SystemFunction.find_by(name: sf_name_1)
    sf_2 = SystemFunction.find_by(name: sf_name_2)
    sf_1.update_attributes(name: sf_name_2) if sf_1.present?
    sf_2.update_attributes(name: sf_name_1) if sf_2.present?
  end
end
