# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on('submit',"#form_salary_table_import",->
    if $("#input_salary_table_excel").val() == ""
      $("#input_salary_table_excel").notify("请选择要导入的excel文件!","error")
      return false

    $.fancybox.showLoading()
    return true
  )
