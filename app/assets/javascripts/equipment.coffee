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

    $.ajax("/equipment.json",
      data: params,
      dataType: "json",
      success: (json)->
        $("#equipment_list_temp_wrapper").loadTemplate($("#equipment_list_temp"),json.equipment_list)
      )

  $(document).on("click","#btn_show_query_equipment",func_query_equipment)
