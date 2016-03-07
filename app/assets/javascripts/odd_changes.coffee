# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #数据信息tab切换
  $(".odd-change-tabs .btn-odd-change").on("click", ->
    $(this).addClass("btn-info")
    $(".table-odd-change").show()
    $(".table-match-recommend").hide()
    $(".btn-match-recommend").removeClass("btn-info")
  )
  $(".odd-change-tabs .btn-match-recommend").on("click", ->
    $(this).addClass("btn-info")
    $(".table-odd-change").hide()
    $(".table-match-recommend").show()
    $(".btn-odd-change").removeClass("btn-info")
  )

