#coding: utf-8
#用户关注
class UserFavorite < ActiveRecord::Base
  self.table_name = "t_user_favorite"
  self.primary_keys = :user_id,:match_id
  belongs_to :user
  belongs_to :match
  scope :favorites_with_user, ->(user_id) {where(user_id: user_id).ransack(match_current_match_match_status_in: ['0','1','2','3','-14']).result}
end
