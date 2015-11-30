#coding: utf-8
class Country < ActiveRecord::Base
  self.table_name = "t_country"
  self.primary_key = "country_id"
  belongs_to :contient,foreign_key: "continents_id"
end
