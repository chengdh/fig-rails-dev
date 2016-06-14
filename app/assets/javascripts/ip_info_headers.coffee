# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #删除按钮的处理
  $(document).on("click",".btn-delete-ip-info-line", (evt)->
    ret = confirm("确认要删除该行吗?")
    return unless ret
    line_tr = $(evt.currentTarget).parents("tr.ip-info-line")
    $(line_tr).find(".destroy").val(1)
    $(line_tr).hide()
  )
  #新增处理
  func_add_new_line = ->
    $("#ip_info_line_tmpl_wrapper").loadTemplate($("#ip_info_line_tmpl"),[{}],{append: true})

  $(".btn-add-new-ip-info-line").on("click",func_add_new_line)


