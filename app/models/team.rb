class Team < ActiveRecord::Base
  self.table_name = "t_teams"
  self.primary_key = "team_id"
end
