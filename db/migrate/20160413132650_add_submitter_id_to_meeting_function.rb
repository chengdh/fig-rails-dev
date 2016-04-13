#coding: utf-8
class AddSubmitterIdToMeetingFunction < ActiveRecord::Migration
  def change
    add_column :meetings, :submitter_id, :integer
    add_column :meetings, :submit_date, :date
    add_column :meetings, :submit_note, :text

  end
end
