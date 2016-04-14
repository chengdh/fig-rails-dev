#coding: utf-8
class AddSubmitterIdToSafetyTable < ActiveRecord::Migration
  def change
    add_column :safety_tables, :submitter_id, :integer
    add_column :safety_tables, :submit_date, :date
    add_column :safety_tables, :submit_note, :text
  end
end
