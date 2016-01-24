#一些共用的操作
$ ->
  #表单提交操作
  $(".btn-submit-form").on("click", ->
    form_id = $(this).data("form-id")
    $("##{form_id}").trigger("submit")
  )
