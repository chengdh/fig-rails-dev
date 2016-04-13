#coding: utf-8
#添加提交用户
class AddSubmiterToAccidentHeader < ActiveRecord::Migration
  def change
    add_column :accident_headers, :submitter_id, :integer
    add_column :accident_headers, :submit_date, :date
    add_column :accident_headers, :submit_note, :text
  end
end
