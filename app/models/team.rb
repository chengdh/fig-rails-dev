class Team < ActiveRecord::Base
  self.table_name = "t_team"
  self.primary_key = "team_id"
end
