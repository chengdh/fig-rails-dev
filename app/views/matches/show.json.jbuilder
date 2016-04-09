m = @match
json.match do
  json.match_id m.match_id
  json.match_time m.match_time.strftime("%H:%M")
  json.league m.league
  json.current_match m.try(:current_match).present? ? m.current_match : {}
  json.team1 do
    json.team_id m.try(:team1).try(:team_id)
    json.cn_name m.try(:team1).try(:cn_name)
    json.logo_url asset_url(m.try(:team1).try(:team_logoname))
  end
  json.team2 do
    json.team_id m.try(:team2).try(:team_id)
    json.cn_name m.try(:team2).try(:cn_name)
    json.logo_url asset_url(m.try(:team2).try(:team_logoname))
  end

  json.status m.status
  json.match_status_before_type_cast m.match_status_before_type_cast
  json.match_describe m.status_des
  json.finished m.finished?
  json.begin goal_cn(m.begin)
  json.is_home_bigdata_recommend m.is_home_bigdata_recommend?
  json.is_home_yinglang_recommend m.is_home_yinglang_recommend?
  json.is_guest_bigdata_recommend m.is_guest_bigdata_recommend?
  json.is_guest_yinglang_recommend m.is_guest_yinglang_recommend?
  #事件
  json.events m.events
  #阵容
  json.lineups m.lineups
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
