# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #赛事筛选中的全选与不选处理
  window.Android.func_select_all_leagues = ->
    console.log("select all leagues")
    $(".btn-league-select").data("select",true)
    $(".btn-league-select").addClass("btn-select")
    $(".btn-league-select").addClass("btn-success")


  window.Android.func_unselect_all_leagues = ->
    console.log("not select all leagues")
    $(".btn-league-select").data("select",false)
    $(".btn-league-select").removeClass("btn-select")
    $(".btn-league-select").removeClass("btn-success")

  toastr.options = {"positionClass": "toast-bottom-center"}

  #联赛筛选界面打开时,传入的筛选参数 q[league_id_in] =
  if $("[data-leagues]").data("leagues")?
    leagues = $("[data-leagues]").data("leagues")
    league_ids = (l.league_id for l in $("[data-leagues]").data("leagues"))
    q_leagues = $.param("q[league_id_in]" : league_ids )
    #FIXME  暂时注释
    window.Android.passString("q_leagues",q_leagues)
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
    window.Android.passString("q_leagues",q_leagues)
  )


  #比赛资料库界面,将关键字或国家传入到Android中
  #默认显示第一个洲及关联国家
  $(".btn-continent-select:first").addClass("btn-primary")
  $(".country-list:first").show()

  #按照关键字查询
  $("#btn_search_leagues_kw").on("click", ->
    if $("#input_search_league_kw").val() == ""
      toastr.error("请输入查询关键字!")
      return
    q_leagues = $.param("q[cn_name_or_country_cn_name_cont]" : $("#input_search_league_kw").val())
    window.Android.passString("q_leagues",q_leagues)
    window.Android.openLeagueSearchActivity()
  )
  $(".btn-continent-select").on("click", ->
    $('.btn-continent-select').removeClass("btn-primary")
    $(this).addClass("btn-primary")
    continent = $(this).data("continent")
    $(".country-list").hide()
    $(".country-list[data-continent-id='" + continent.continents_id + "']").show()
  )

  #按照所属国家查询
  $(".btn-country-select").on("click",->
    country = $(this).data("country")
    q_leagues = $.param("q[country_country_id_eq]" : country.country_id)
    window.Android.passString("q_leagues",q_leagues)
    window.Android.openLeagueListActivity()
  )

  #选择赛事
  $(".league-select").on("click",->
    league = $(this).data("league")
    window.Android.passString("league_id",league.league_id)
    window.Android.openLeagueShowActivity()
  )

  #赛事资料tab切换
  $(".league-tabs .btn").on("click",(evt)->
    this_el = evt.currentTarget
    class_name = $(this_el).data("link-el-class")
    $(".season-rankings,.season-schedules,.season-goals,.season-balls,.season-archers,.cup-rankings,.cup-schedules").hide()
    $(class_name).show()
    $(".league-tabs .btn").removeClass("btn-info")
    $(this_el).addClass("btn-info")
  )

#赛季切换
  $(".select-season").on("change", ->
    league_id = $(".input_league_id").val()
    params = $.param("q[season_id_eq]": $(this).val())
    window.location.href = "/leagues/#{league_id}?#{params}"
  )
  #杯赛阶段切换
  $(".select-stage").on("change", ->
    league_id = $(".input_league_id").val()
    params = $.param(
      "q[season_id_eq]": $(".select-season").val(),
      "q[stage_id_eq]": $(this).val()
    )
    window.location.href = "/leagues/#{league_id}?#{params}"
  )

