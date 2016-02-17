#coding: utf-8
#设备添加图片功能
class AddPhotoToEquipment < ActiveRecord::Migration
  def up
    add_attachment :equipment, :photo
  end

  def down
    remove_attachment :equipment, :photo
  end

end
