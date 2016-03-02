#coding: utf-8
class AddPhotoFieldToTraining < ActiveRecord::Migration
  def up
    add_attachment :trainings, :photo_1
    add_attachment :trainings, :photo_2
    add_attachment :trainings, :photo_3
    add_attachment :trainings, :photo_4
    add_attachment :trainings, :photo_5
    add_attachment :trainings, :photo_6
    add_attachment :trainings, :photo_7
  end

  def down
    remove_attachment :trainings, :photo_1
    remove_attachment :trainings, :photo_2
    remove_attachment :trainings, :photo_3
    remove_attachment :trainings, :photo_4
    remove_attachment :trainings, :photo_5
    remove_attachment :trainings, :photo_6
    remove_attachment :trainings, :photo_7
  end
end
