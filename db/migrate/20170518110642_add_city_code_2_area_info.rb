#coding: utf-8
class AddCityCode2AreaInfo < ActiveRecord::Migration
  def change
    add_column :area_infos,:city_code,:string,limit: 30
    add_column :area_infos,:district_code,:string,limit: 30
  end
end
