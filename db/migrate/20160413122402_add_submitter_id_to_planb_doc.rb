#coding: utf-8
class AddSubmitterIdToPlanbDoc < ActiveRecord::Migration
  def change
    add_column :planb_docs, :submitter_id, :integer
    add_column :planb_docs, :submit_date, :date
    add_column :planb_docs, :submit_note, :text
  end
end
