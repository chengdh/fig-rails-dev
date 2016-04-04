#coding: utf-8
class AddKFilesMarksToAssessment < ActiveRecord::Migration
  def change
    add_column :assessments, :k_files_marks, :decimal,precision: 10,scale: 2,default: 0
  end
end
