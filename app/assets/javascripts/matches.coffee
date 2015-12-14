# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

  $(".match-tr").on("click", ->
    match = $(this).data("match")
    json_str = JSON.stringify({match_id : match.match_id})
    Android.passObject("args",json_str)
    Android.openMatchImmediateShowActivity()
  )
  #比赛详情页面事件
  $(".match-detail li").on("click",(evt)->
    this_el = evt.currentTarget
    class_name = $(this_el).data("link-el-class")
    $(".events,.lineups,.analyse,.odds-asian,.odds-europe,.odds-ball").hide()
    $(class_name).show()
    $(".match-detail li").removeClass("active")
    $(this_el).addClass("active")
  )
