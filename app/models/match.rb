#coding: utf-8
#比赛
class Match < ActiveRecord::Base
  self.table_name = "t_match"
  self.primary_key = "match_id"

  #default_scope {order("match_time ASC")}
  #如果当前是下午时间则显示今天十二点到明天十二点之间的比赛
  #如果是上午则显示昨天十二点到今天十二点之间的比赛
  #以即时比赛表数据为基础进行筛选
  #DateTime.now 返回的是utc时间
  # (DateTime.now + 8.hours).hour  <= 12 ? (DateTime.now + 8.hours).end_of_day - 36.hours : (DateTime.now + 8.hours).end_of_day  - 12.hours ,
  #
  #                                                                                   (DateTime.now + 8.hours).hour <= 12 ? (DateTime.now + 8.hours).end_of_day - 12.hours : (DateTime.now + 8.hours).end_of_day + 12.hours ).order("t_current_match.match_status DESC,t_match.match_time ASC")
  #服务器是操作系统是北京时间
  #数据库中的数据是北京时间
  #rails认为数据库中的时间字段是utc时间,但是实际上数据库中的时间字段是北京时间
  #查询时,rails会自动把日期转换为utc时间
  scope :immediate,-> {joins(:current_match).includes(:league,:team1,:team2,:match_recommands).where("(t_current_match.match_status > 0) OR (match_time - 8/24 >= ? and match_time - 8/24 <= ?)",
                                                                                                    DateTime.now.hour  <= 12 ? DateTime.now.end_of_day - 36.hours  : DateTime.now.end_of_day  - 12.hours  ,
                                                                                                    DateTime.now.hour  <= 12 ? DateTime.now.end_of_day - 12.hours  : DateTime.now.end_of_day  + 12.hours  ).order("t_current_match.match_status DESC,t_match.match_time ASC")
  }

  #scope :immediate,-> {joins(:current_match).includes(:league,:team1,:team2,:match_recommands).where(match_id: [1130325,1130328,1130319,1080205,1155680])}

  #赛果 前7天
  scope :last_week,->(d) {where("home_score IS NOT NULL AND TO_CHAR(match_time,'YYYY-MM-DD') = ? ",d)}
  #scope :last_week,-> {where(match_id: [1130325,1130328,1130319,1080205,1155680])}

  #赛程 本周
  scope :this_week,->(d) {where("TO_CHAR(match_time,'YYYY-MM-DD') = ? ",d)}
  #scope :this_week,-> {where(match_id: [1130325,1130328,1130319,1080205,1155680])}

  #sb滚球数据
  scope :sb_list, -> {joins(:current_match).includes(:league,:team1,:team2,:match_recommands).where("t_current_match.match_status not in (-1,-10)").order("t_match.match_time ASC")}


  belongs_to :league
  belongs_to :team1,class_name: "Team"
  belongs_to :team2,class_name: "Team"

  has_one :current_match

  #当前亚盘
  has_many :odds_asians
  #当前欧盘
  has_many :odds_europes

  has_many :odds_balls
  has_many :events
  has_many :home_events,->{where(:ishome=> true)},class_name: "Event"
  has_many :guest_events,->{where(:ishome=> false)},class_name: "Event"
  has_many :match_recommands

  #亚欧赔率统计-初盘
  has_many :odds_rates_begin,->{where(:odds_type => 1)},class_name: "OddsRate"
  #亚欧赔率统计-终盘
  has_many :odds_rates_final,->{where(:odds_type => 3)},class_name: "OddsRate"
  #滚球数据
  has_many :odds_rolls

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
    Match.where("home_score IS NOT NULL AND (team1_id = ? AND team2_id = ?) OR (team1_id = ? AND team2_id = ?) AND match_time <= ?",team1_id,team2_id,team2_id,team1_id,1.days.ago).limit(10).order("data_time DESC")
  end
  #近10场主队战绩
  def matches_recent_home
    Match.where("home_score IS NOT NULL AND (team1_id = ? OR team2_id = ?) AND match_time <= ? ",team1_id,team1_id,1.days.ago + 8.hours).limit(10).order("data_time DESC")
  end
  #近10场客队战绩
  def matches_recent_guest
    Match.where("home_score IS NOT NULL AND (team1_id = ? OR team2_id = ?) AND match_time <= ?",team2_id,team2_id,1.days.ago + 8.hours).limit(10).order("data_time DESC")
  end

  #当前亚盘数据
  def current_odds_asians
    ret_begin = {}
    ret_current = {}
    ret_final = {}
    companies = Company.all
    companies.each do |c|
      home = odds_asians.where(company: c,odds_type: 1).limit(1).first
      #即时盘只用显示最新的数据
      goal = odds_asians.where(company: c).limit(1).first
      away = odds_asians.where(company: c,odds_type: 3).limit(1).first
      if home.blank? and goal.blank? and away.blank?
        companies -= [c]
      else
        ret_begin[c] = home
        ret_current[c] = goal
        ret_final[c] = away
      end
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
      beg = odds_europes.where(company: c,odds_type: 1).limit(1).first
      #即时盘只用显示最新的数据
      current = odds_europes.where(company: c).limit(1).first

      final = odds_europes.where(company: c,odds_type: 3).limit(1).first


      if beg.blank? and current.blank? and final.blank?
        companies -= [c]
      else
        ret_begin[c] = beg
        ret_current[c] = current
        ret_final[c] = final
      end
    end
    [companies,[ret_begin,ret_current,ret_final]]
  end

  def current_odds_balls
    ret_begin = {}
    ret_current = {}
    ret_final = {}
    companies = Company.all
    companies.each do |c|
      beg = odds_balls.where(company: c,odds_type: 1).limit(1).first

      #即时盘只用显示最新的数据
      current = odds_balls.where(company: c).limit(1).first

      final = odds_balls.where(company: c,odds_type: 3).limit(1).first


      if beg.blank? and current.blank? and final.blank?
        companies -= [c]
      else
        ret_begin[c] = beg
        ret_current[c] = current
        ret_final[c] = final
      end
    end
    [companies,[ret_begin,ret_current,ret_final]]
  end

  #是否已开赛
  def started?
    not [0,-11,-14].include?(match_status_before_type_cast)
  end
  #比赛是否已结束
  def finished?
    home_score.present? or try(:current_match).try(:match_status) == -1
  end
  #当前状态
  #中场
  #已开场 分钟数
  def status
    ret = ""
    match_status = match_status_before_type_cast
    #上半场
    if match_status == 1
      start_ms = ((Time.now + 8.hours - current_match.first_time)/60).round
      ret = "#{start_ms}'"
    #中场
    elsif match_status == 2
      ret = "中场"

    #下半场
    elsif match_status == 3
      start_ms = ((Time.now + 8.hours - current_match.second_time)/60).round + 45
      ret = "#{start_ms}'"
      ret = "90+" if start_ms > 90
    elsif match_status == 4
      ret = "加实赛"
    elsif match_status == -1
      ret = "完"

    elsif match_status == -10
      ret = "取消"
    elsif match_status == -11
      ret = "待定"
    elsif match_status == -14
      ret = "推迟"

    end
    ret
  end
  def match_status_before_type_cast
    ret = try(:current_match).try(:match_status)
    ret = 0 if ret.blank?
    #比赛结束后,home_score数值会被更新
    ret = -1 if home_score.present?
    ret
  end

  def status_des
    status = match_status_before_type_cast
    ret = ""
    ret = "未开" if status == 0
    #完场
    ret = "#{home_score} : #{guest_score}" if status == -1
    ret = "#{try(:current_match).try(:home_score)} : #{try(:current_match).try(:guest_score)}" if [1,2,3].include?(status)
    ret
  end

  #亚盘初盘
  def begin
    odds_asians.where(odds_type: 1).limit(1).first.try(:goal)
  end
  def current
    odds_asians.where(odds_type: 2).limit(1).first.try(:goal)
  end
  def final
    odds_asians.where(odds_type: 3).limit(1).first.try(:goal)
  end

  #推荐情况
  def is_home_bigdata_recommend?
    match_recommands.where(team_id: team1_id,recommend_type: 1).present?
  end

  def is_home_yinglang_recommend?
    match_recommands.where(team_id: team1_id,recommend_type: 2).present?
  end

  def is_guest_bigdata_recommend?
    match_recommands.where(team_id: team2_id,recommend_type: 1).present?
  end

  def is_guest_yinglang_recommend?
    match_recommands.where(team_id: team2_id,recommend_type: 2).present?
  end

  def self.immediate_leagues
    immediate.map {|m| m.league}.uniq!
  end
  def self.this_week_leagues
    this_week.map {|m| m.league}.uniq!
  end
  def self.last_week_leagues
    last_week.map {|m| m.league}.uniq!
  end
end
