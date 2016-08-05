#coding: utf-8
#比赛推荐
class MatchRecommand < ActiveRecord::Base
  self.table_name = "t_match_recommend"
  self.primary_keys = :match_id,:team_id,:recommend_type
  belongs_to :match
  belongs_to :team
  default_scope {includes(:team,:match).order("t_match.match_time DESC")}

  scope :unread,->(data_time) {where("TO_CHAR(t_match_recommend.data_time,'YYYY-MM-DD HH24:MI') > ? ",data_time)}
  #最近胜场
  scope :recent_win,-> {where("t_match_recommend.result_type > 0 AND t_match_recommend.recommend_type = 1 ").limit(10)}

  #推荐结果（2、全赢；1、半赢；0、走；-1、半输；-2、全输）
  #计算胜率
  #（全赢+半赢）/（全部比赛-走场）
  def self.win_rate(q,recommend_type)
    sum_win_all = q.result.where("result_type = 2 ").where(recommend_type: recommend_type).sum(1)
    sum_win_half = q.result.where("result_type = 1 ").where(recommend_type: recommend_type).sum(1)
    sum_matches = q.result.where("result_type <> 0 ").where(recommend_type: recommend_type).sum(1)
    win_rate = 0
    win_rate = ((sum_win_all + sum_win_half).to_f/sum_matches.to_f*100).round(1) if sum_matches > 0
    win_rate
  end

  #计算胜场
  def self.win_count(q,recommend_type)
    sum_win_all = q.result.where("result_type = 2 ").where(recommend_type: recommend_type).sum(1)
    sum_win_half = q.result.where("result_type = 1 ").where(recommend_type: recommend_type).sum(1)
    sum_lost_all = q.result.where("result_type = -2 ").where(recommend_type: recommend_type).sum(1)
    sum_lost_half = q.result.where("result_type = -1 ").where(recommend_type: recommend_type).sum(1)
    win_count = 0
    win_count = (sum_win_all + sum_win_half*0.5) - (sum_lost_all + sum_lost_half*0.5)
    win_count
  end
end
