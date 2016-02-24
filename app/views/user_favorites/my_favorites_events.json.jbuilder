json.array!(@events) do |evt|
  json.extract! evt, :match_id, :event_type, :happen_time,:ishome
  json.player_name1 evt.player_name1.present? ? evt.player_name1 : ""
  json.player_name2 evt.player_name2.present? ? evt.player_name2 : ""
  json.event_type_des event_type_des(evt.event_type)
  json.home_or_guest evt.ishome? ? "主队" : "客队"
  json.data_time evt.data_time.strftime("%Y-%m-%d %H:%M")
  json.match_des "#{evt.try(:match).try(:team1).try(:cn_name)}vs#{evt.try(:match).try(:team2).try(:cn_name)}"
end
