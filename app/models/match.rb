#coding: utf-8
#比赛
class Match < ActiveRecord::Base
  self.table_name = "t_match"
  self.primary_key = "match_id"
  #即时比赛 比赛时间 >= 100分钟前 而且 比赛时间<=  24小时 
  #scope :immediate,-> {where("match_tme >= ? and match_time <= ?",3.days.ago,1.days.since)}
  scope :immediate,-> {where(match_id: [1130325,1130328,1130319,1080205])}

  #赛果 前7天
  scope :last_week,-> {where("match_time <= ? and match_time >= ?",1.days.ago,7.days.ago)}

  #赛程 本周
  scope :this_week,-> {where("match_time >= ? and match_time <= ?",Date.today.beginning_of_week,Date.today.end_of_week)}

  belongs_to :league
  belongs_to :team1,class_name: "Team"
  belongs_to :team2,class_name: "Team"

  has_one :current_match

  #当前亚盘
  has_many :odds_asians
  #当前欧盘
  has_many :odds_europes

  has_many :odds_balls
  has_many :odds_events

  #主队首发阵容
  has_many :home_start_line_ups ,->(lineup) {joins(:match).where(odds_type: 1).where("t_lineup.team_id = t_match.team1_id")},class_name: "Lineup"
  #主队替补
  has_many :home_substitute_line_ups ,->(lineup) {joins(:match).where(odds_type: 2).where("t_lineup.team_id = t_match.team1_id")},class_name: "Lineup"
  #主队伤兵
  has_many :home_wounded_line_ups ,->(lineup) {joins(:match).where(odds_type: 3).where("t_lineup.team_id = t_match.team1_id")},class_name: "Lineup"
  #主队停赛
  has_many :home_stopped_line_ups ,->(lineup) {joins(:match).where(odds_type: 4).where("t_lineup.team_id = t_match.team1_id")},class_name: "Lineup"

  #客队首发阵容
  has_many :guest_start_line_ups ,->(lineup) {joins(:match).where(odds_type: 1).where("t_lineup.team_id = t_match.team2_id")},class_name: "Lineup"
  #客队替补
  has_many :guest_substitute_line_ups ,->(lineup) {joins(:match).where(odds_type: 2).where("t_lineup.team_id = t_match.team2_id")},class_name: "Lineup"
  #客队伤兵
  has_many :guest,->(lineup) {joins(:match).where(odds_type: 3).where("t_lineup.team_id = t_match.team2_id")},class_name: "Lineup"
  #客队停赛
  has_many :guest_stopped_line_ups ,->(lineup) {joins(:match).where(odds_type: 4).where("t_lineup.team_id = t_match.team2_id")},class_name: "Lineup"

  #联赛积分排名-主队-1总  2主 3客 4近
  has_many :home_league_rankings,->(ranking) {joins(:match).where("t_league_rankings.team_id = t_match.team1_id")},class_name: "LeagueRanking"
  #has_one :home_league_ranking_home,->(ranking) {joins(:match).where(odds_type: 2).where("t_league_rankings.team_id = t_match.team1_id")},class_name: "LeagueRanking"
  #has_one :home_league_ranking_visiting,->(ranking) {joins(:match).where(odds_type: 3).where("t_league_rankings.team_id = t_match.team1_id")},class_name: "LeagueRanking"
  #has_one :home_league_ranking_recent,->(ranking) {joins(:match).where(odds_type: 4).where("t_league_rankings.team_id = t_match.team1_id")},class_name: "LeagueRanking"

  #联赛积分排名-客队-1总  2主 3客 4近
  has_many :guest_league_rankings,->(ranking) {joins(:match).where("t_league_rankings.team_id = t_match.team2_id")},class_name: "LeagueRanking"
  #has_one :guest_league_ranking_home,->(ranking) {joins(:match).where(odds_type: 2).where("t_league_rankings.team_id = t_match.team2_id")},class_name: "LeagueRanking"
  #has_one :guest_league_ranking_visiting,->(ranking) {joins(:match).where(odds_type: 3).where("t_league_rankings.team_id = t_match.team2_id")},class_name: "LeagueRanking"
  #has_one :guest_league_ranking_recent,->(ranking) {joins(:match).where(odds_type: 4).where("t_league_rankings.team_id = t_match.team2_id")},class_name: "LeagueRanking"
  #
  #对赛往绩
  def matches_history
    Match.where("(team1_id = ? AND team2_id = ?) OR (team1_id = ? AND team2_id = ?) AND match_time <= ?",team1_id,team2_id,team2_id,team1_id,1.days.ago).limit(10).order("match_time DESC")
  end
  #近10场主队战绩
  def matches_recent_home
    Match.where("team1_id = ? or team2_id = ? AND match_time <= ? ",team1_id,team1_id,1.days.ago).limit(10).order("match_time DESC")
  end
  #近10场客队战绩
  def matches_recent_guest
    Match.where("team1_id = ? OR team2_id = ? AND match_time <= ?",team2_id,team2_id,1.days.ago).limit(10).order("match_time DESC")
  end

  #当前亚盘数据
  def current_odds_asians
    ret_begin = {}
    ret_current = {}
    ret_final = {}
    companies = Company.all
    companies.each do |c|
      ret_begin[c] = odds_asians.where(company: c,odds_type: 1).first
      ret_current[c] = odds_asians.where(company: c,odds_type: 2).first
      ret_final[c] = odds_asians.where(company: c,odds_type: 3).first
    end
    [companies,[ret_begin,ret_current,ret_final]]
  end


  #当前欧盘数据
  def current_odds_europes
    ret_begin = {}
    ret_current = {}
    ret_final = {}
    companies = Company.all
    companies.each do |c|
      ret_begin[c] = odds_europes.where(company: c,odds_type: 1).first
      ret_current[c] = odds_europes.where(company: c,odds_type: 2).first
      ret_final[c] = odds_europes.where(company: c,odds_type: 3).first
    end
    [companies,[ret_begin,ret_current,ret_final]]

  end

  def current_odds_balls
    ret_begin = {}
    ret_current = {}
    ret_final = {}
    companies = Company.all
    companies.each do |c|
      ret_begin[c] = odds_balls.where(company: c,odds_type: 1).first
      ret_current[c] = odds_balls.where(company: c,odds_type: 2).first
      ret_final[c] = odds_balls.where(company: c,odds_type: 3).first
    end
    [companies,[ret_begin,ret_current,ret_final]]
  end



  #当前状态
  #未开
  #中场
  #已开场 分钟数
  def status
    ret = ""
    if match_time > Time.now
      ret = "未开"
    elsif 45.minutes.ago >= match_time and 60.minutes.ago <= match_time
      ret = "中场"
    elsif 90.minutes.ago > match_time
      ret = "90+"
    else
      ret = try(:current_match).try(:match_min)
    end
    ret
  end

  #亚盘初盘
  def begin
    odds_asians.where(odds_type: 1).try(:first).try(:home)
  end
  def current
    odds_asians.where(odds_type: 2).try(:first).try(:home)
  end
  def final
    odds_asians.where(odds_type: 3).try(:first).try(:home)
  end
end
