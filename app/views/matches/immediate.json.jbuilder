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
  json.is_home_bigdata_recommend m.is_home_bigdata_recommend?
  json.is_home_yinglang_recommend m.is_home_yinglang_recommend?
  json.is_guest_bigdata_recommend m.is_guest_bigdata_recommend?
  json.is_guest_yinglang_recommed m.is_guest_yinglang_recommend?
end
