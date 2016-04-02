#coding: utf-8
#添加隐患处理图片
class AddPhotoToHiddenDanger < ActiveRecord::Migration
  def change
    add_attachment :hidden_dangers, :photo_1
    add_attachment :hidden_dangers, :photo_2
    add_attachment :hidden_dangers, :photo_3
    add_attachment :hidden_dangers, :photo_4
    add_attachment :hidden_dangers, :photo_5
    add_attachment :hidden_dangers, :photo_6

    add_attachment :hidden_dangers, :fixed_photo_1
    add_attachment :hidden_dangers, :fixed_photo_2
    add_attachment :hidden_dangers, :fixed_photo_3
    add_attachment :hidden_dangers, :fixed_photo_4
    add_attachment :hidden_dangers, :fixed_photo_5
    add_attachment :hidden_dangers, :fixed_photo_6
  end
end
