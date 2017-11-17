#coding: utf-8
class ChangeTprojectTypeFromCuxPmPreProject < ActiveRecord::Migration
  def change
    rename_column :cux_pm_pre_projects_a,:tproject_type,:project_type
  end
end
