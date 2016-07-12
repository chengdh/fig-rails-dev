json.extract! mr, :match_id, :team_id,:recommend_type,:data_time,:win_money,:home,:goal,:away,:real_goal
json.result_type mr.result_type.blank? ? -100 : mr.result_type
