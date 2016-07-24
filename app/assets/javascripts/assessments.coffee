# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #年度变化时候,更新hidden_field的值
  $(".assessment_year_report #select_year").on("change",->
    year = $(this).val()
    $("#q_mth_gteq").val("#{year}01")
    $("#q_mth_lteq").val("#{year}12")
  )
