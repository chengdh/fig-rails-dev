# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #有无考核
  $("#training_is_assess").on("click", ->
    checked = $(this).prop("checked")
    if checked
      $(".assess_type_label").show()
      $(".qualified_rate_label").show()
      $("#training_assess_type").show()
      $("#training_qualified_rate").show()
    else
      $(".assess_type_label").hide()
      $(".qualified_rate_label").hide()
      $("#training_assess_type").hide()
      $("#training_qualified_rate").hide()
  )
