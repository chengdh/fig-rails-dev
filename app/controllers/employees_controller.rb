#coding: utf-8
#雇员信息
class EmployeesController < BaseController
  table :org,:name,:mobile,:qq
  def search
    render partial: "search"
  end
  private
  def employee_params
    params.require(:employee).permit(:org_id, :name, :gender, :birthday, :academic, :graduate_from, :id_no, :mobile, :address, :email, :qq, :wechat, :work_day, :post, :note)
  end
end
