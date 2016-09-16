# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#删除按钮的处理
$ ->
  $(document).on("click",".btn-delete-company-vpn-line", (evt)->
    ret = confirm("确认要删除该行吗?")
    return unless ret
    line_tr = $(evt.currentTarget).parents("tr.company-vpn-line")
    $(line_tr).find(".destroy").val(1)
    $(line_tr).hide()
  )
  #新增处理
  func_add_new_line = ->
    $("#company_vpn_line_tmpl_wrapper").loadTemplate($("#company_vpn_line_tmpl"),[{}],{append: true})

    el_index = 0
    resource_name = "company_vpn"
    for el_tr in $("tr.company-vpn-line")
      #username
      $(el_tr).find(".username").attr("name","#{resource_name}[company_vpn_lines_attributes][#{el_index}][username]")
      #employee_name
      $(el_tr).find(".employee_name").attr("name","#{resource_name}[company_vpn_lines_attributes][#{el_index}][employee_name]")
      #own_org_id
      $(el_tr).find(".own_org_id").attr("name","#{resource_name}[company_vpn_lines_attributes][#{el_index}][own_org_id]")
      #post
      $(el_tr).find(".post").attr("name","#{resource_name}[company_vpn_lines_attributes][#{el_index}][post]")

      #mobile
      $(el_tr).find(".mobile").attr("name","#{resource_name}[company_vpn_lines_attributes][#{el_index}][mobile]")
      #power
      $(el_tr).find(".power").attr("name","#{resource_name}[company_vpn_lines_attributes][#{el_index}][power]")

      #_destroy
      $(el_tr).find(".destroy").attr("name","#{resource_name}[company_vpn_lines_attributes][#{el_index}][_destroy]")
      el_index += 1


  $(".btn-add-new-company-vpn-line").on("click",func_add_new_line)

  #机构发生变化时，更新部门列表
  $("input[name='company_vpn[org_id]']").on("change",->
    org_id = $(this).val()
    $.get("/orgs/#{org_id}.json").done((ret)->
      options = []
      options.push("<option value=#{co.id}>#{co.name}</option>") for co in ret.children
      $(".children_org_select").empty()
      $(".children_org_select").val("").trigger("change")
      $(".children_org_select").append(op)  for op in options
    )
  )
