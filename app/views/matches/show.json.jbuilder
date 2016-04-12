m = @match
json.match do
  #比赛id
  json.match_id m.match_id
  #比赛时间
  json.match_time m.match_time.strftime("%H:%M")
  #关联联赛
  json.league m.league
  #当前比赛
  json.current_match m.try(:current_match).present? ? m.current_match : {}
  #主队
  json.team1 do
    #队伍id
    json.team_id m.try(:team1).try(:team_id)
    #队伍名称
    json.cn_name m.try(:team1).try(:cn_name)
    #队伍图标url
    json.logo_url asset_url(m.try(:team1).try(:team_logoname))
  end
  #客队
  json.team2 do
    #队伍id
    json.team_id m.try(:team2).try(:team_id)
    #队伍名称
    json.cn_name m.try(:team2).try(:cn_name)
    #队伍图标url
    json.logo_url asset_url(m.try(:team2).try(:team_logoname))
  end

  #比赛状态
  json.status m.status
  json.match_status_before_type_cast m.match_status_before_type_cast
  #比赛状态描述
  json.match_describe m.status_des
  #比赛是否结束
  json.finished m.finished?
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
  #事件
  json.events m.events
  #主队首发阵容
  json.home_start_line_ups m.home_start_line_ups
  #主队替补阵容
  json.home_substitute_line_ups m.home_substitute_line_ups
  #主队伤兵
  json.home_wounded_line_ups m.home_wounded_line_ups
  #主队停赛
  json.home_stopped_line_ups m.home_stopped_line_ups

  #客队首发阵容
  json.guest_start_line_ups m.guest_start_line_ups
  #客队替补
  json.guest_substitute_line_ups m.guest_substitute_line_ups 
  #客队伤兵
  json.guest_wounded_line_ups m.guest_wounded_line_ups
  #客队停赛
  json.guest_stopped_line_ups m.guest_stopped_line_ups


  #主队-联赛积分排名
  json.team1_league_rankings m.home_league_rankings
  #客队-联赛积分排名
  json.team2_league_rankings m.guest_league_rankings
  #近期战绩-主队
  json.team1__match_history m.matches_recent_home
  #近期战绩-客队
  json.team2_match_history m.matches_recent_guest
  #亚赔
  json.odds_asian m.current_odds_asians
  #欧赔
  json.odds_europe m.current_odds_europes
  #大小球
  json.odds_ball m.current_odds_balls
end
