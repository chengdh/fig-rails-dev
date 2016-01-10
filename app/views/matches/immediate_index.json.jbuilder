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
  json.begin goal_cn(m.begin)

  #博彩公司数据
  json.companies m.current_odds_asians.first
  #亚盘初盘
  json.odds_asians_begin m.current_odds_asians.second.first.values do |o|
    json.company_name o.try(:company).try(:cn_name)
    json.home o.try(:home)
    json.goal goal_en(o.try(:goal))
    json.away o.try(:away)
  end
  #亚盘即时
  json.odds_asians_current m.current_odds_asians.second.second.values do |o|
    json.company_name o.try(:company).try(:cn_name)
    json.home o.try(:home)
    json.goal goal_en(o.try(:goal))
    json.away o.try(:away)
  end
end
