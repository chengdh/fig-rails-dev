#coding: utf-8
#添加照片到reward
class AddPhotoToReward < ActiveRecord::Migration
  def up
    add_attachment :rewards, :photo_1
    add_attachment :rewards, :photo_2
    add_attachment :rewards, :photo_3
    add_attachment :rewards, :photo_4
    add_attachment :rewards, :photo_5
    add_attachment :rewards, :photo_6
    add_attachment :rewards, :photo_7
  end

  def down
    remove_attachment :rewards, :photo_1
    remove_attachment :rewards, :photo_2
    remove_attachment :rewards, :photo_3
    remove_attachment :rewards, :photo_4
    remove_attachment :rewards, :photo_5
    remove_attachment :rewards, :photo_6
    remove_attachment :rewards, :photo_7
  end
end
