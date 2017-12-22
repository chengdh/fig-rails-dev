#coding: utf-8
#员工信息
class SoaHrEmployee < ActiveRecord::Base
  self.table_name = "soa_hr_employee_a"
  self.primary_key = "id"

  def self.sync_with_ebs
    #FIXME 使用GT会出错
    (1..1000).each do |i|
      p_item_array =[]
      p_item_array << {
        "VTYPE" => "INT",
        "VNAME" => "id",
        "VVALUE" => i,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
  end
end
