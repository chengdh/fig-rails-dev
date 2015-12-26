#coding: utf-8
#州
class Contient < ActiveRecord::Base
  self.table_name = "t_continents"
  self.primary_key = "continents_id"

  default_scope -> {order("sort_value ASC")}

  has_many :countries,foreign_key: "continents_id"

end
