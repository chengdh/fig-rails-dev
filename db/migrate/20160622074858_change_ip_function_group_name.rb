#coding: utf-8
class ChangeIpFunctionGroupName < ActiveRecord::Migration
  def change
    sfg = SystemFunctionGroup.find_by(name: "信息-任务管理")
    sfg.update_attributes(name: "综合-任务管理") if sfg.present?
  end
end
