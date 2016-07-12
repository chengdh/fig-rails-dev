#比赛相关的联赛对象
json.immediate_leagues  @matches.to_a.map{|m| m.league}
json.matches @matches do |m|
  #比赛id
  json.match_id m.match_id
  #比赛时间
  json.match_time m.match_time.strftime("%H:%M")
  #关联联赛
  json.league m.league
  #当前比赛对象
  json.current_match m.try(:current_match).present? ? m.current_match : {}
  json.team1 do
    #主队id
    json.team_id m.try(:team1).try(:team_id)
    #主队名称
    json.cn_name m.try(:team1).try(:cn_name)
    #主队logo
    json.logo_url asset_url(m.try(:team1).try(:team_logoname))
  end
  json.team2 do
    #客队id
    json.team_id m.try(:team2).try(:team_id)
    #客队名称
    json.cn_name m.try(:team2).try(:cn_name)
    #客队logo
    json.logo_url asset_url(m.try(:team2).try(:team_logoname))
  end

  #比赛状态
  json.status m.status
  #比赛状态描述
  json.match_describe m.status_des

  #主队进球数
  json.home_score m.home_score
  #客队进球数
  json.guest_score m.guest_score

  #半场主队进球数
  json.half_home_score m.half_home_score
  #半场客队进球数
  json.half_guest_score m.half_guest_score

  json.match_status_before_type_cast m.match_status_before_type_cast
  #比赛是否结束
  json.finished m.finished?

  #推荐水位
  json.recommend_goal_des goal_cn(m.recommend_goal)
  json.recommend_goal m.recommend_goal
  #初盘水位
  json.begin goal_cn(m.begin)
  #主队是否大数据推荐
  json.is_home_bigdata_recommend m.is_home_bigdata_recommend?
  #主队是否盈朗推荐
  json.is_home_yinglang_recommend m.is_home_yinglang_recommend?
  #客队是否大数据推荐
  json.is_guest_bigdata_recommend m.is_guest_bigdata_recommend?
  #客队是否赢朗推荐
  json.is_guest_yinglang_recommend m.is_guest_yinglang_recommend?
  #关联推荐信息
  json.match_recommands do
    json.array! m.try(:match_recommands), partial: 'match_recommands/show_for_app', as: :mr
    #json.array! Match.find(1139284).match_recommands, partial: 'match_recommands/show_for_app', as: :mr
  end
end
