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

  #亚盘初盘
  json.odds_asian do
    json.home m.odds_asians.try(:first).try(:home)
    json.goal m.odds_asians.try(:first).try(:goal)
    json.away m.odds_asians.try(:first).try(:away)
  end
  json.odds_ball do
    json.over m.odds_balls.try(:first).try(:over)
    json.goal m.odds_balls.try(:first).try(:goal)
    json.under m.odds_balls.try(:first).try(:under)
  end
  json.odds_europe do
    json.hw m.odds_europes.try(:first).try(:hw)
    json.st m.odds_europes.try(:first).try(:st)
    json.aw m.odds_europes.try(:first).try(:aw)
  end
end
