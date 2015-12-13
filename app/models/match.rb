#coding: utf-8
#比赛
class Match < ActiveRecord::Base

  #即时比赛 比赛时间 >= 100分钟前 而且 比赛时间<=  24小时 
  scope :immediate,-> {where("match_time >= ? and match_time <= ?",3.days.ago,1.days.since)}

  #赛果 前7天
  scope :last_week,-> {where("match_time <= ? and match_time >= ?",1.days.ago,7.days.ago)}

  #赛程 本周
  scope :this_week,-> {where("match_time >= ? and match_time <= ?",Date.today.beginning_of_week,Date.today.end_of_week)}

  self.table_name = "t_match"
  self.primary_key = "match_id"
  belongs_to :league
  belongs_to :team1,class_name: "Team"
  belongs_to :team2,class_name: "Team"

  has_one :current_match

  has_many :odds_asians
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
  has_many :visiting_start_line_ups ,->(lineup) {joins(:match).where(odds_type: 1).where("t_lineup.team_id = t_match.team2_id")},class_name: "Lineup"
  #客队替补
  has_many :visiting_substitute_line_ups ,->(lineup) {joins(:match).where(odds_type: 2).where("t_lineup.team_id = t_match.team2_id")},class_name: "Lineup"
  #客队伤兵
  has_many :visiting_wounded_line_ups ,->(lineup) {joins(:match).where(odds_type: 3).where("t_lineup.team_id = t_match.team2_id")},class_name: "Lineup"
  #客队停赛
  has_many :visiting_stopped_line_ups ,->(lineup) {joins(:match).where(odds_type: 4).where("t_lineup.team_id = t_match.team2_id")},class_name: "Lineup"




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
