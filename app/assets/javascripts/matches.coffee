# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".fancybox").fancybox()
  $(document).on("click",".match-tr", (evt)->
    #如果点击的是收藏按钮,则直接返回
    el = evt.target
    if($(el).hasClass("favorite-star") or $(el).hasClass("btn-favorite") or
      $(el).hasClass("icon-bigdata") or $(el).hasClass("btn-bigdata") or
      $(el).hasClass("recommend-flag") or
      $(el).hasClass("btn-home-bigdata-recommand") or $(el).hasClass("btn-home-yinglang-recommand") or
      $(el).hasClass("btn-guest-bigdata-recommand") or $(el).hasClass("btn-guest-yinglang-recommand")
    )
      evt.stopPropagation()
      return

    match = $(this).data("match")
    json_str = JSON.stringify(match_id : match.match_id)
    Android.passObject("args",json_str)
    Android.openMatchImmediateShowActivity()
  )

  #比赛详情页面事件
  $(".match-tabs .btn").on("click",(evt)->
    this_el = evt.currentTarget
    class_name = $(this_el).data("link-el-class")
    $(".events,.lineups,.analyse,.odds-asian,.odds-europe,.odds-ball").hide()
    $(class_name).show()
    $(".match-tabs .btn").removeClass("btn-info")
    $(this_el).addClass("btn-info")
  )

  #一周赛果,时间变化
  $("#select_last_week_match_time_eq").on("change", ->
    match_time = $(this).val()
    q ={
      "q[match_time_eq]" : match_time
    }
    param = $.param(q)
    window.location.href = "/matches/last_week?" + param
  )
  $(".btn-last-week-yesterday,.btn-last-week-tomorrow").on("click", ->
    the_day = $(this).data("day")
    $("#select_last_week_match_time_eq").val(the_day).trigger("change")
  )

  #一周赛程,时间变化
  $("#select_this_week_match_time_eq").on("change", ->
    match_time = $(this).val()
    q ={
      "q[match_time_eq]" : match_time
    }
    param = $.param(q)
    window.location.href = "/matches/this_week?" + param
  )
  $(".btn-this-week-yesterday,.btn-this-week-tomorrow").on("click", ->
    the_day = $(this).data("day")
    $("#select_this_week_match_time_eq").val(the_day).trigger("change")
  )
