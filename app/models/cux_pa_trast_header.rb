#coding: utf-8
#项目资产信息
class CuxPaTrastHeader < ActiveRecord::Base
  self.table_name = "cux_pa_trast_header_a"
  self.primary_key = "header_id"
  belongs_to :cux_pa,foreign_key: :project_id
end
