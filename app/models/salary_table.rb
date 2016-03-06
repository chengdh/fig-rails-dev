#coding: utf-8
class SalaryTable < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  validates :org_id,:name,:mth,:user_id, presence: true
  has_many :salary_table_lines,dependent: :destroy
  accepts_nested_attributes_for :salary_table_lines
  def self.new_with_params(org_id,mth)
    table = SalaryTable.find_by(org_id: org_id,mth: mth)
    return table if table.present?
    table = SalaryTable.new(org_id: org_id,mth: mth)
    Employee.where(is_active: true).each do |e|
      table.salary_table_lines.build(employee: e)
    end
    table
  end
end
