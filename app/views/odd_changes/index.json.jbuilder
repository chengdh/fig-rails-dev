json.odd_changes @odd_changes.limit(5) do |o|
  #球队
  json.team do
    #队伍id
    json.team_id o.try(:team).try(:team_id)
    #队伍名称
    json.cn_name o.try(:team).try(:cn_name)
    #队伍图标url
    json.logo_url asset_url(o.try(:team).try(:team_logoname))
  end
  #关联比赛
  json.match o.try(:match)
  #变化类型-参考数据库设计文档
  json.change_type o.try(:change_type)
  #比赛类型-参考数据库设计文档
  json.match_type o.try(:match_type)
  #变化类型描述
  json.change_type_des change_type_des(o.try(:change_type))
  #比赛类型描述
  json.match_type_des match_type_des(o.try(:match_type))
  #以下字段参考数据库设计文档(目前无用)
  json.home1 o.try(:home1)
  json.goal1 o.try(:goal1)
  json.away1 o.try(:away1)
  json.home2 o.try(:home2)
  json.goal2 o.try(:goal2)
  json.away2 o.try(:away2)
  #变化时间timestamp
  json.timestamp o.try(:data_time).to_time.to_i
  #变化时间
  json.data_time_str o.try(:data_time).strftime("%Y-%m-%d %H:%M")
end

