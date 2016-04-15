#coding: utf-8
class AddCheckerIdToAccidentHeader < ActiveRecord::Migration
  def change
    add_column :accident_headers, :checker_id, :integer
    add_column :accident_headers, :check_opinion, :text
    add_column :accident_headers, :check_date, :date
  end
end
