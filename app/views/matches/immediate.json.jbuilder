json.immediate_leagues  @matches.to_a.map{|m| m.league}
json.matches @matches do |m|
  json.match_id m.match_id
  json.match_time m.match_time.strftime("%H:%M")
  json.league m.league
  json.current_match m.try(:current_match).present? ? m.current_match : {}
  json.team1 m.try(:team1)
  json.team2 m.try(:team2)
  json.status m.status
  json.match_status_before_type_cast m.match_status_before_type_cast
  json.match_describe m.status_des
  json.finished m.finished?
  json.begin goal_cn(m.begin)
  json.is_home_bigdata_recommend m.is_home_bigdata_recommend?
  json.is_home_yinglang_recommend m.is_home_yinglang_recommend?
  json.is_guest_bigdata_recommend m.is_guest_bigdata_recommend?
  json.is_guest_yinglang_recommend m.is_guest_yinglang_recommend?
end
