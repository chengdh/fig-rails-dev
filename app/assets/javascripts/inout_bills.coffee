# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  func_on_select_equipment_confirm = (evt,obj)->
    $("#inout_line_temp_wrapper").loadTemplate($("#inout_line_temp"),obj.selected_items,{append: true})
    #需要重新设置name字段
    el_index = 0
    resource_name = $("#inout_line_temp_wrapper").parents("form").data("resource-name")
    for el_tr in $(".tr-inout-line")
      #equipment_id
      $(el_tr).find(".equipment_id").attr("name","#{resource_name}[inout_lines_attributes][#{el_index}][equipment_id]")
      #qty
      $(el_tr).find(".qty").attr("name","#{resource_name}[inout_lines_attributes][#{el_index}][qty]")
      #price
      $(el_tr).find(".price").attr("name","#{resource_name}[inout_lines_attributes][#{el_index}][price]")
      #_destroy
      $(el_tr).find(".destroy").attr("name","#{resource_name}[inout_lines_attributes][#{el_index}][_destroy]")
      el_index += 1

  $("#inout_line_temp_wrapper").on("select_equipment_confirm",func_on_select_equipment_confirm)

  #删除按钮的处理
  $(document).on("click",".btn-delete-inout-line", (evt)->
    ret = confirm("确认要删除该行吗?")
    return unless ret
    inout_line_tr = $(evt.currentTarget).parents("tr.tr-inout-line")
    $(inout_line_tr).find(".destroy").val(1)
    $(inout_line_tr).hide()
  )
