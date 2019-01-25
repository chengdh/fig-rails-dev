# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #需求计划详情页面事件
  $(".cux-demand-tabs .btn").on("click",(evt)->
    this_el = evt.currentTarget
    class_name = $(this_el).data("link-el-class")
    $(".header,.lines,.audits,.attachments,.assets,.tasks,.option").hide()
    $(class_name).show()
    $(".cux-demand-tabs .btn").removeClass("btn-info")
    $(this_el).addClass("btn-info")
  )
