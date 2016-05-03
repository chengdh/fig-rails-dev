# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #设备查询
  func_query_equipment = ->
    params =
        "q[name_cont]": $("#equipment_name_cont").val(),
        "q[equipment_category_id_eq]": $("#equipment_category_id_eq").val(),
        "q[model_cont]": $("#equipment_model_cont").val(),
        "q[factory_name_cont]": $("#equipment_factory_name_cont").val()

    url = $(this).data("url")
    setting = 
      url: url,
      data: params,
      dataType: "json"

    $.ajax(setting).done((json)->
        $("#equipment_list_temp_wrapper").loadTemplate($("#equipment_list_temp"),json.equipment_list)
      )

  $(document).on("click","#btn_show_query_equipment",func_query_equipment)

  #选择设备
  func_on_select_equipment_confirm = ->
    return if $("input.cbx-select-equipment:checked").length == 0
    selected_equipment_list =[]
    for cbx_eq in $("input.cbx-select-equipment:checked")
      eq_id = $(cbx_eq).val()
      eq_name =  $(cbx_eq).parents("tr").find(".name").text()
      equipment_category_name =  $(cbx_eq).parents("tr").find(".equipment_category_name").text()
      unit_name =  $(cbx_eq).parents("tr").find(".unit_name").text()
      factory_name = $(cbx_eq).parents("tr").find(".factory_name").text()
      model = $(cbx_eq).parents("tr").find(".model").text()
      purchase_price =  $(cbx_eq).parents("tr").find(".purchase_price").text()
      selected_equipment_list.push(
        equipment_id: eq_id,
        name: eq_name,
        equipment_category_name: equipment_category_name,
        unit_name: unit_name,
        factory_name: factory_name,
        model: model,
        purchase_price: purchase_price
      )

    #判断是采购订单还是其他单据
    if $("form.purchase_order_it,form.purchase_order_asset,form.purchase_order_consume,form.purchase_order_virtual").length > 0
      $("#po_line_temp_wrapper").trigger("select_equipment_confirm",selected_items: selected_equipment_list)
    else
      $("#inout_line_temp_wrapper").trigger("select_equipment_confirm",selected_items: selected_equipment_list)
    $.fancybox.close()

  $(document).on("click","#btn_equipment_select_confirm",func_on_select_equipment_confirm)
