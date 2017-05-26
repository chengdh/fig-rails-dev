#coding: utf-8
#项目过程审批
class CuxPa < ActiveRecord::Base
  self.table_name = "cux_pas"
  self.primary_key = "project_id"
  has_many :cux_pa_tasks,foreign_key: :project_id
  has_many :cux_pa_trast_headers,foreign_key: :project_id
end
