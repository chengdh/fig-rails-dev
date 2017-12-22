#coding: utf-8
class CuxPmPreOption < ActiveRecord::Base
  self.table_name = "cux_pm_pre_option_t"
  # self.primary_key = "project_id"
  belongs_to :cux_pm_project,foreign_key: :project_id
end
