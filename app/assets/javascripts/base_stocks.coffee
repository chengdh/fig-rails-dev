# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #库存查询
  func_query_stock = ->
    params =
        "q[qty_gt]": 0,
        "q[location_id_eq]": $("#t_location_id").val(),
        "q[no_eq]": $("#no_eq").val(),
        "q[equipment_name_cont]": $("#equipment_name_cont").val(),
        "q[equipment_category_id_eq]": $("#equipment_category_id_eq").val(),
        "q[model_cont]": $("#equipment_model_cont").val(),
        "q[factory_name_cont]": $("#equipment_factory_name_cont").val()

    url = $(this).data("url")
    settings =
      url: url,
      data: params,
      dataType: "json"

    $.ajax(settings).done((json)->
        $("#stock_list_temp_wrapper").loadTemplate($("#stock_list_temp"),json.stock_list)
      )

  $(document).on("click","#btn_query_stock",func_query_stock)

  #选择库存设备
  func_on_select_stock_confirm = ->
    return if $("input.cbx-select-stock:checked").length == 0
    selected_stock_list =[]
    for cbx_stock in $("input.cbx-select-stock:checked")
      eq_id = $(cbx_stock).val()
      line_no =  $(cbx_stock).parents("tr").find(".no").text()
      eq_name =  $(cbx_stock).parents("tr").find(".name").text()
      equipment_category_name =  $(cbx_stock).parents("tr").find(".equipment_category_name").text()
      unit_name =  $(cbx_stock).parents("tr").find(".unit_name").text()
      factory_name = $(cbx_stock).parents("tr").find(".factory_name").text()
      model = $(cbx_stock).parents("tr").find(".model").text()
      purchase_price =  $(cbx_stock).parents("tr").find(".purchase_price").text()
      selected_stock_list.push(
        line_no: line_no,
        equipment_id: eq_id,
        name: eq_name,
        equipment_category_name: equipment_category_name,
        unit_name: unit_name,
        factory_name: factory_name,
        model: model,
        purchase_price: purchase_price
      )
    is_receive = false

    if $("form.receive_bill,form.receive_bill_asset").length > 0
      is_receive = true

    #is_reveive 是否是领用单据
    $("#inout_line_temp_wrapper").trigger("select_stock_confirm",selected_items: selected_stock_list,is_receive: is_receive)
    $.fancybox.close()

  $(document).on("click","#btn_stock_select_confirm",func_on_select_stock_confirm)
