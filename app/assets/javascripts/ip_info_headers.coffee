# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #删除按钮的处理
  $(document).on("click",".btn-delete-ip-info-line", (evt)->
    ret = confirm("确认要删除该行吗?")
    return unless ret
    line_tr = $(evt.currentTarget).parents("tr.ip-info-line")
    $(line_tr).find(".destroy").val(1)
    $(line_tr).hide()
  )
  #新增处理
  func_add_new_line = ->
    $("#ip_info_line_tmpl_wrapper").loadTemplate($("#ip_info_line_tmpl"),[{}],{append: true})
    el_index = 0
    resource_name = "ip_info_header"
    for el_tr in $("tr.ip-info-line")
      #org_id
      $(el_tr).find(".org_id").attr("name","#{resource_name}[ip_info_lines_attributes][#{el_index}][org_id]")
      #post
      $(el_tr).find(".post").attr("name","#{resource_name}[ip_info_lines_attributes][#{el_index}][post]")
      #employee_name
      $(el_tr).find(".employee_name").attr("name","#{resource_name}[ip_info_lines_attributes][#{el_index}][employee_name]")
      #ip
      $(el_tr).find(".ip").attr("name","#{resource_name}[ip_info_lines_attributes][#{el_index}][ip]")
      #mac
      $(el_tr).find(".mac").attr("name","#{resource_name}[ip_info_lines_attributes][#{el_index}][mac]")
      #net_type
      $(el_tr).find(".net_type").attr("name","#{resource_name}[ip_info_lines_attributes][#{el_index}][net_type]")
      #note
      $(el_tr).find(".note").attr("name","#{resource_name}[ip_info_lines_attributes][#{el_index}][note]")
      #_destroy
      $(el_tr).find(".destroy").attr("name","#{resource_name}[ip_info_lines_attributes][#{el_index}][_destroy]")
      el_index += 1

  $(".btn-add-new-ip-info-line").on("click",func_add_new_line)

  #机构发生变化时，更新部门列表
  $(".ip_info_org_select").on("change",->
    org_id = $(this).val()
    $.get("/orgs/#{org_id}.json").done((ret)->
      console.log(ret)
      options = []
      options.push("<option value=#{co.id}>#{co.name}</option>") for co in ret.children
      $(".children_org_select").empty()
      $(".children_org_select").val("").trigger("change")
      $(".children_org_select").append(op)  for op in options
    )
  )
