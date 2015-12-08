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
