# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #删除按钮的处理
  $(document).on("click",".btn-delete-vpn-info-line", (evt)->
    ret = confirm("确认要删除该行吗?")
    return unless ret
    line_tr = $(evt.currentTarget).parents("tr.vpn-info-line")
    $(line_tr).find(".destroy").val(1)
    $(line_tr).hide()
  )
  #新增处理
  func_add_new_line = ->
    $("#vpn_info_line_tmpl_wrapper").loadTemplate($("#vpn_info_line_tmpl"),[{}],{append: true})

    el_index = 0
    resource_name = "vpn_info"
    for el_tr in $("tr.vpn-info-line")
      #username
      $(el_tr).find(".username").attr("name","#{resource_name}[vpn_info_lines_attributes][#{el_index}][username]")
      #pwd
      $(el_tr).find(".pwd").attr("name","#{resource_name}[vpn_info_lines_attributes][#{el_index}][pwd]")
      #ip
      $(el_tr).find(".ip").attr("name","#{resource_name}[vpn_info_lines_attributes][#{el_index}][ip]")
      #own_org_id
      $(el_tr).find(".own_org_id").attr("name","#{resource_name}[vpn_info_lines_attributes][#{el_index}][own_org_id]")
      #employee_name
      $(el_tr).find(".employee_name").attr("name","#{resource_name}[vpn_info_lines_attributes][#{el_index}][employee_name]")
      #mobile
      $(el_tr).find(".mobile").attr("name","#{resource_name}[vpn_info_lines_attributes][#{el_index}][mobile]")
      #power
      $(el_tr).find(".power").attr("name","#{resource_name}[vpn_info_lines_attributes][#{el_index}][power]")
      #note
      $(el_tr).find(".note").attr("name","#{resource_name}[vpn_info_lines_attributes][#{el_index}][note]")
      #_destroy
      $(el_tr).find(".destroy").attr("name","#{resource_name}[vpn_info_lines_attributes][#{el_index}][_destroy]")
      el_index += 1


  $(".btn-add-new-vpn-info-line").on("click",func_add_new_line)

  #机构发生变化时，更新部门列表
  $(".vpn_info_org_id_select").on("change",->
    org_id = $(this).val()
    $.get("/orgs/#{org_id}.json").done((ret)->
      options = []
      options.push("<option value=#{co.id}>#{co.name}</option>") for co in ret.children
      $(".children_org_select").empty()
      $(".children_org_select").val("").trigger("change")
      $(".children_org_select").append(op)  for op in options
    )
  )


