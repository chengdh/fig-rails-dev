#coding: utf-8
#即时比赛信息
class CurrentMatch < ActiveRecord::Base
  belongs_to :match
end
