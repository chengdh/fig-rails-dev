json.matches do
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
end

json.stat do
  #大数据推荐胜场
  json.big_data_win_count @bigdata_match_recommands.sum(:result_type).to_f/2
  #大数据推荐胜率
  json.big_data_win_rate (@success_bigdata_match_recommands.sum(1).to_f / @bigdata_match_recommands.where("result_type <> 0").sum(1).to_f*100).round(1)
  #大数据推荐赢钱
  json.big_data_win_money @bigdata_match_recommands.sum(:win_money)



  #盈朗推荐胜场
  json.yinglang_win_count @yinglang_match_recommands.sum(:result_type).to_f/2
  #盈朗推荐胜率
  json.yinglang_win_rate (@success_yinglang_match_recommands.sum(1).to_f / @yinglang_match_recommands.where("result_type <> 0").sum(1).to_f*100).round(1)
  #盈朗推荐赢钱
  json.yinglang_recommend_win_money @yinglang_match_recommands.sum(:win_money)
end
