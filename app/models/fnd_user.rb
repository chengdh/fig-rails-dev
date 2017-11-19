#coding: utf-8
class FndUser < ActiveRecord::Base
  self.table_name = "fnd_user_a"
  self.primary_key = "id"
  belongs_to :soa_hr_employee,foreign_key: :employee_id

  def org_id
    try(:soa_hr_employee).try(:org_id)
  end
  def employee_name
    try(:soa_hr_employee).try(:last_name)
  end
  def self.get_users_by_org_id(org_id)
    employee_ids = SoaHrEmployee.where(org_id: org_id).pluck(:id)
    users = FndUser.where(employee_id: employee_ids).includes(:soa_hr_employee).limit(500).to_json(
      methods: [:org_id,:employee_name]
    )
  end

  def self.get_users_by_user_id(user_id)
    cur_user = FndUser.find(user_id)
    cur_employee = cur_user.soa_hr_employee
    cur_org_id = cur_employee.org_id
    employee_ids = SoaHrEmployee.where(org_id: cur_org_id).pluck(:id)
    users = FndUser.where(employee_id: employee_ids).includes(:soa_hr_employee).limit(500).to_json(
      methods: [:org_id,:employee_name]
    )
  end

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
