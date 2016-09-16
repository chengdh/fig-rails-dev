# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on("click",".btn-delete-wifi-client-line", (evt)->
    ret = confirm("确认要删除该行吗?")
    return unless ret
    line_tr = $(evt.currentTarget).parents("tr.wifi-client-line")
    $(line_tr).find(".destroy").val(1)
    $(line_tr).hide()
  )
  #新增处理
  func_add_new_line = ->
    $("#wifi_client_line_tmpl_wrapper").loadTemplate($("#wifi_client_line_tmpl"),[{}],{append: true})

    el_index = 0
    resource_name = "wifi_client"
    for el_tr in $("tr.wifi-client-line")
      #username
      $(el_tr).find(".username").attr("name","#{resource_name}[wifi_client_lines_attributes][#{el_index}][username]")
      #own_org_id
      $(el_tr).find(".own_org_id").attr("name","#{resource_name}[wifi_client_lines_attributes][#{el_index}][own_org_id]")
      #dev_type
      $(el_tr).find(".dev_type").attr("name","#{resource_name}[wifi_client_lines_attributes][#{el_index}][dev_type]")
      #mac
      $(el_tr).find(".mac").attr("name","#{resource_name}[wifi_client_lines_attributes][#{el_index}][mac]")
      #_destroy
      $(el_tr).find(".destroy").attr("name","#{resource_name}[wifi_client_lines_attributes][#{el_index}][_destroy]")
      el_index += 1


  $(".btn-add-new-wifi-client-line").on("click",func_add_new_line)

  #机构发生变化时，更新部门列表
  $("input[name='wifi_client[org_id]']").on("change",->
    org_id = $(this).val()
    $.get("/orgs/#{org_id}.json").done((ret)->
      options = []
      options.push("<option value=#{co.id}>#{co.name}</option>") for co in ret.children
      $(".children_org_select").empty()
      $(".children_org_select").val("").trigger("change")
      $(".children_org_select").append(op)  for op in options
    )
  )
