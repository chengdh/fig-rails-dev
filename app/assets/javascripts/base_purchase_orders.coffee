# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  func_on_select_equipment_confirm = (evt,obj)->
    $("#po_line_temp_wrapper").loadTemplate($("#po_line_simple_temp"),obj.selected_items,{append: true})
    #需要重新设置name字段
    el_index = 0
    resource_name = $("#po_line_temp_wrapper").parents("form").data("resource-name")
    for el_tr in $(".tr-po-line")
      #equipment_id
      $(el_tr).find(".equipment_id").attr("name","#{resource_name}[po_lines_attributes][#{el_index}][equipment_id]")
      #qty
      $(el_tr).find(".qty").attr("name","#{resource_name}[po_lines_attributes][#{el_index}][qty]")
      #price
      $(el_tr).find(".price").attr("name","#{resource_name}[po_lines_attributes][#{el_index}][price]")
      #brand
      $(el_tr).find(".brand").attr("name","#{resource_name}[po_lines_attributes][#{el_index}][brand]")
      #model
      $(el_tr).find(".model").attr("name","#{resource_name}[po_lines_attributes][#{el_index}][model]")
      #note
      $(el_tr).find(".note").attr("name","#{resource_name}[po_lines_attributes][#{el_index}][note]")
      #_destroy
      $(el_tr).find(".destroy").attr("name","#{resource_name}[po_lines_attributes][#{el_index}][_destroy]")
      el_index += 1

    $("input.qty").trigger("change")

  $("#po_line_temp_wrapper").on("select_equipment_confirm",func_on_select_equipment_confirm)

  #删除按钮的处理
  $(document).on("click",".btn-delete-po-line", (evt)->
    ret = confirm("确认要删除该行吗?")
    return unless ret
    po_line_tr = $(evt.currentTarget).parents("tr.tr-po-line")
    $(po_line_tr).find(".destroy").val(1)
    $(po_line_tr).hide()
  )

  #价格及数量变化处理
  $(document).on('change',"input.price,input.qty", ->
    qty = $(this).parents("tr").find(".qty").val()
    price = $(this).parents("tr").find(".price").val()
    amt = parseFloat(qty)*parseFloat(price)
    $(this).parents("tr").find(".amt").html(amt)
  )
