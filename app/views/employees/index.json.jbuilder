json.array!(@employees) do |employee|
  json.extract! employee, :id, :org_id, :name, :gender, :birthday, :academic, :graduate_from, :id_no, :mobile, :address, :email, :qq, :wechat, :work_day, :post, :note
  json.url employee_url(employee, format: :json)
end
