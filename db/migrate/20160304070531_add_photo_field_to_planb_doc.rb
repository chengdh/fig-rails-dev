#coding: utf-8
class AddPhotoFieldToPlanbDoc < ActiveRecord::Migration
  def up
    add_attachment :planb_docs, :photo_1
    add_attachment :planb_docs, :photo_2
    add_attachment :planb_docs, :photo_3
    add_attachment :planb_docs, :photo_4
    add_attachment :planb_docs, :photo_5
    add_attachment :planb_docs, :photo_6
    add_attachment :planb_docs, :photo_7
    add_attachment :planb_docs, :photo_8
  end
  def down
    remove_attachment :planb_docs, :photo_1
    remove_attachment :planb_docs, :photo_2
    remove_attachment :planb_docs, :photo_3
    remove_attachment :planb_docs, :photo_4
    remove_attachment :planb_docs, :photo_5
    remove_attachment :planb_docs, :photo_6
    remove_attachment :planb_docs, :photo_7
    remove_attachment :planb_docs, :photo_8
  end
end
