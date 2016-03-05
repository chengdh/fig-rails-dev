#coding: utf-8
class AddPhotoToMeeting < ActiveRecord::Migration
  def up
    add_attachment :meetings, :photo_1
    add_attachment :meetings, :photo_2
    add_attachment :meetings, :photo_3
    add_attachment :meetings, :photo_4
    add_attachment :meetings, :photo_5
    add_attachment :meetings, :photo_6
    add_attachment :meetings, :photo_7
  end

  def down
    remove_attachment :meetings, :photo_1
    remove_attachment :meetings, :photo_2
    remove_attachment :meetings, :photo_3
    remove_attachment :meetings, :photo_4
    remove_attachment :meetings, :photo_5
    remove_attachment :meetings, :photo_6
    remove_attachment :meetings, :photo_7
  end

end
