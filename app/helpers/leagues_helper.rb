#coding: utf-8
module LeaguesHelper
  def seasons_for_select(league_id)
    Season.where(league_id: league_id).map {|s| [s.season_name,s.season_id]}
  end
  #stages for select
  def stages_for_select(league_id,season_id)
    Stage.where(league_id: league_id,season_id: season_id).map {|s| [s.stage_name,s.stage_id]}
  end

end
