#coding: utf-8
class AddSubmitterIdToTraining < ActiveRecord::Migration
  def change
    add_column :trainings, :submitter_id, :integer
    add_column :trainings, :submit_date, :date
    add_column :trainings, :submit_note, :text
  end
end
