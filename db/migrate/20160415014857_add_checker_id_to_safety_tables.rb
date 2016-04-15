#coding: utf-8
class AddCheckerIdToSafetyTables < ActiveRecord::Migration
  def change
    add_column :safety_tables, :checker_id, :integer
    add_column :safety_tables, :check_opinion, :text
    add_column :safety_tables, :check_date, :date

  end
end
