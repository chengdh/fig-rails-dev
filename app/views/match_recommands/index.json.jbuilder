json.array!(@match_recommands) do |mr|
  json.match_id mr.match_id
  json.recommend_type_des  mr.recommend_type == 1 ? "大数据推荐" : "赢朗推荐"
  json.match_des "#{mr.team.cn_name}"
  json.match_time mr.match.match_time.strftime("%Y-%m-%d %H:%M")
  json.league_name mr.match.league.cn_name
  json.data_time mr.data_time.strftime("%Y-%m-%d %H:%M")
  #盘口
  json.begin goal_cn(mr.match.begin)
  #推荐结果
  json.result_type mr.result_type
  #钱
  json.win_money mr.win_money
end
