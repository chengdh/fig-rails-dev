#coding: utf-8
class ChangeSystemGroupOrder < ActiveRecord::Migration
  def change
    sfg = SystemFunctionGroup.find_by(name: "综合-任务管理")
    sfg.update_attributes(order_by: 10000) if sfg.present?

    sfg = SystemFunctionGroup.find_by(name: "网站后台管理")
    sfg.update_attributes(order_by: 11000) if sfg.present?

    sfg = SystemFunctionGroup.find_by(name: "系统设置")
    sfg.update_attributes(order_by: 90000) if sfg.present?

  end
end
