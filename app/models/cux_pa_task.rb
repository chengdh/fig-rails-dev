#coding: utf-8
#项目过程审批-任务预算
class CuxPaTask < ActiveRecord::Base
  self.table_name = "cux_pa_tasks"
  self.primary_key = "task_id"
  belongs_to :cux_pa,foreign_key: :project_id
end