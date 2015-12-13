#coding: utf-8
#联赛积分排名
class LeagueRanking < ActiveRecord::Base
  self.table_name = "t_league_rankings"
  self.primary_keys = :match_id, :team_id,:odds_type
  default_scope {order("odds_type ASC")}
  belongs_to :match
  belongs_to :team

  #描述信息
  #类型（1、总；2、主；3、客；4、近）
  def describe
    ret = ""
    ret = "总" if attributes_before_type_cast['odds_type'] == 1
    ret = "主" if  attributes_before_type_cast['odds_type'] == 2
    ret = "客" if  attributes_before_type_cast['odds_type'] == 3
    ret = "近" if  attributes_before_type_cast['odds_type'] == 4
    ret
  end
  #胜率
  def win_rate
    rate = win / (games.to_f)
    "#{rate.round(2)*100}%"
  end
end
