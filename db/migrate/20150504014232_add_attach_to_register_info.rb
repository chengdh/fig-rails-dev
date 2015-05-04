#coding: utf-8
#添加附件字段
class AddAttachToRegisterInfo < ActiveRecord::Migration
  def change
    add_attachment :register_infos,:attach_1
    add_attachment :register_infos,:attach_2
    add_attachment :register_infos,:attach_3
    add_attachment :register_infos,:attach_4
    add_attachment :register_infos,:attach_5
    add_attachment :register_infos,:attach_6
    add_attachment :register_infos,:attach_7
    add_attachment :register_infos,:attach_8
    add_attachment :register_infos,:attach_9
    add_attachment :register_infos,:attach_10
  end
end
