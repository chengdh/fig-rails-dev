#coding: utf-8
class Company < ActiveRecord::Base
  self.table_name = "t_company"
  self.primary_key = "company_id"
end
