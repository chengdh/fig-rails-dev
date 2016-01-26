json.immediate_leagues Match.immediate_leagues
json.matches @matches do |m|
  json.match_id m.match_id
  json.match_time m.match_time.strftime("%H:%M")
  json.league m.league
  json.current_match m.try(:current_match).present? ? m.current_match : {}
  json.team1 m.try(:team1)
  json.team2 m.try(:team2)
  json.status m.status
  json.match_status_before_type_cast m.match_status_before_type_cast
  json.match_describe m.try(:match_status_before_type_cast) == 0 ? "未开" : "#{m.try(:current_match).try(:home_score)} : #{m.try(:current_match).try(:guest_score)}"
  json.begin m.begin

  #博彩公司数据
  json.companies m.current_odds_asians.first
  #亚盘初盘
  json.odds_asians_begin m.current_odds_asians.second.first.values do |o|
    json.company_name o.try(:company).try(:cn_name)
    json.home o.try(:home)
    json.goal o.try(:goal)
    json.away o.try(:away)
  end
  #亚盘即时
  json.odds_asians_current m.current_odds_asians.second.second.values do |o|
    json.company_name o.try(:company).try(:cn_name)
    json.home o.try(:home)
    json.goal o.try(:goal)
    json.away o.try(:away)
  end
  #欧盘初盘
  json.odds_europes_begin m.current_odds_europes.second.first.values do |o|
    json.company_name o.try(:company).try(:cn_name)
    json.hw o.try(:hw)
    json.st o.try(:st)
    json.aw o.try(:aw)
  end
  #欧盘即时
  json.odds_europes_current m.current_odds_europes.second.second.values do |o|
    json.company_name o.try(:company).try(:cn_name)
    json.hw o.try(:hw)
    json.st o.try(:st)
    json.aw o.try(:aw)
  end

  #大小球初盘
  json.odds_balls_begin m.current_odds_balls.second.first.values do |o|
    json.company_name o.try(:company).try(:cn_name)
    json.over o.try(:over)
    json.goal o.try(:goal)
    json.under o.try(:under)
  end
  #大小球即时
  json.odds_balls_current m.current_odds_balls.second.second.values do |o|
    json.company_name o.try(:company).try(:cn_name)
    json.over o.try(:over)
    json.goal o.try(:goal)
    json.under o.try(:under)
  end
end
