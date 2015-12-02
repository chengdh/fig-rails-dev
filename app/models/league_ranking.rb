#coding: utf-8
#联赛积分排名
class LeagueRanking < ActiveRecord::Base
  belongs_to :match
  belongs_to :team
end
