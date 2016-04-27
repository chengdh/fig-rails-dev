json.array!(@match_recommands) do |mr|
  json.match_id mr.match_id
  json.recommend_type_des  mr.recommend_type == 1 ? "大数据推荐" : "赢朗推荐"
  json.match_des "#{mr.team.cn_name}"
  #推荐队伍id
  json.team_id mr.team_id
  #比赛时间
  json.match_time mr.match.match_time.strftime("%Y-%m-%d %H:%M")
  #关联联赛
  json.league_name mr.match.league.cn_name
  #当前比赛对象
  json.current_match mr.match.try(:current_match).present? ? mr.match.current_match : {}
  json.team1 do
    #主队id
    json.team_id mr.try(:match).try(:team1).try(:team_id)
    #主队名称
    json.cn_name mr.try(:match).try(:team1).try(:cn_name)
    #主队logo
    json.logo_url asset_url(mr.try(:match).try(:team1).try(:team_logoname))
  end
  json.team2 do
    #客队id
    json.team_id mr.try(:match).try(:team2).try(:team_id)
    #客队名称
    json.cn_name mr.try(:match).try(:team2).try(:cn_name)
    #客队logo
    json.logo_url asset_url(mr.try(:match).try(:team2).try(:team_logoname))
  end

  #比赛状态
  json.status mr.match.status
  #比赛状态描述
  json.match_describe mr.match.status_des

  #主队进球数
  json.home_score mr.match.home_score
  #客队进球数
  json.guest_score mr.match.guest_score

  #半场主队进球数
  json.half_home_score mr.match.half_home_score
  #半场客队进球数
  json.half_guest_score mr.match.half_guest_score

  json.match_status_before_type_cast mr.match.match_status_before_type_cast
  #比赛是否结束
  json.finished mr.match.finished?

  #推荐水位
  json.recommend_goal_des goal_cn(mr.goal)
  json.recommend_goal mr.goal

  #初盘水位
  json.begin goal_cn(mr.match.begin)
  #推荐结果
  json.result_type mr.result_type
  #钱
  json.win_money mr.win_money
end
