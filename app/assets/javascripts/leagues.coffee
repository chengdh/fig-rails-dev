# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #联赛筛选界面打开时,传入的筛选参数 q[league_id_in] =
  if $("[data-leagues]").length > 0
    league_ids = (l.league_id for l in $("[data-leagues]").data("leagues"))
    q_leagues = $.param("q[league_id_in]" : league_ids )
    Android.passString("q_leagues",q_leagues)
    console.log("set leagues : " + q_leagues)

  #赛事筛选
  $(".btn-league-select").on("click",->
    if $(this).data('select')
      $(this).data('select',false)
      $(this).removeClass("btn-success")
    else
      $(this).data('select',true)
      $(this).addClass("btn-success")

    #将选中的赛事id发送给android
    league_ids = ($(el).data('league').league_id for el in $(".btn-league-select") when $(el).data("select"))
    q_leagues = $.param("q[league_id_in]" : league_ids )
    Android.passString("q_leagues",q_leagues)
  )
