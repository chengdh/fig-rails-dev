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

  #字段变化时,字段计算
  $(".input-salary-item[is_calculate='false']").on("change",(evt)->
    tr = $(evt.currentTarget).parents("tr.salary-table-line")

    #上下文变量
    context = {}
    all_fields = tr.find("input[col]")
    for field in $(all_fields)
      col_name = $(field).attr('col')
      val = $(field).val()
      if $.isNumeric(val)
        context[col_name] = parseFloat(val)

    #查找计算字段
    cal_fields = tr.find(".input-salary-item[is_calculate='true']")

    for field in $(cal_fields)
      item_info = $(field).data("item")
      formula = item_info.formula

      #参考http://stackoverflow.com/questions/543533/restricting-eval-to-a-narrow-scope
      #在自定义的上下文变量中执行代码
      ret_val = (new Function( "with(this) { return " + formula + "}")).call(context)

      $(field).val(ret_val)
  )
