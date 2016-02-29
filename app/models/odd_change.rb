#coding: utf-8
#盘口数据变化
class OddChange < ActiveRecord::Base
  self.table_name = "t_odds_change"
  belongs_to :team
  belongs_to :match
  has_many :match_recommands,through: :team

  default_scope {order("data_time DESC")}

  scope :unread,->(data_time) {where("TO_CHAR(data_time - 8/24,'YYYY-MM-DD HH24:MI') > ? ",data_time)}

  #是否大数据推荐
  def is_bigdata_recommend?
    match_recommands.where(match_id: match_id,recommend_type: 1).exists?
  end
  def is_yinglang_recommend?
    match_recommands.where(match_id: match_id,recommend_type: 2).exists?
  end
end
