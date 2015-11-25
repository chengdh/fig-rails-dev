#coding: utf-8
#州
class Contient < ActiveRecord::Base
  self.table_name = "t_continents"
  self.primary_key = "continents_id"
end
