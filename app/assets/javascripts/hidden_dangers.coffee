# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#postponement_hidden_danger_form").on("submit",->
    post_note = $("#postponement_note").val()
    if post_note.trim() == "" or post_note.length < 20
      $("#postponement_note").notify("请输入延期说明.","error")
      return false
  )
