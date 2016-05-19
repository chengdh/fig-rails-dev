# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #选择是否满足要求后,改进内容enable切换
  $('.cbx_audit_item_state').on('click',->
    id = $(this).attr("id")
    fix_id = id.substring(0,22)
    checked = $(this).prop('checked')
    if checked
      $("##{fix_id}_fix").attr("readonly",true)
    else
      $("##{fix_id}_fix").attr("readonly",false)
  )
