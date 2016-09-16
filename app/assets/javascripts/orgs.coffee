# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#org-tree-data").orgChart(container: $("#org-tree"))

  #所属机构字段的处理
  org_nodes = $("#global_orgs").data("orgs")

  $('.orgs_select_in_form').livequery(-> $(this).treeview({data: [org_nodes]}))
  $(document).on("click",".orgs_select_wrapper #btn_org_id_select",-> $(".orgs_select_in_form").toggle())
  $(document).on("click",".orgs_select_wrapper #btn_org_id_clear",->
    $(".orgs_select_in_form").hide()
    $(".orgs_select_wrapper #org_id").val("")
    $(".orgs_select_wrapper #org_display").val("")
  )
  on_select_org = (evt,node)->
    console.log(node)
    $(".orgs_select_wrapper #org_id").val(node.id).trigger("change")
    $(".orgs_select_wrapper #org_display").val(node.text)
    $(".orgs_select_in_form").hide()

  $(document).on("nodeSelected",".orgs_select_in_form",on_select_org)

  #查询窗口中所属机构字段的处理
  $('.orgs_select_in_search_form').livequery(-> $(this).treeview({data: [org_nodes]}))
  $(document).on("click",".orgs_select_search_wrapper #btn_org_id_in_select",-> $(".orgs_select_in_search_form").toggle())
  $(document).on("click",".orgs_select_search_wrapper #btn_org_id_in_clear",->
    $(".orgs_select_in_search_form").hide()
    field_name = $(".orgs_select_in_search_form").data("field_name")
    $("input[name='#{field_name}']").remove()
    $(".orgs_select_search_wrapper #org_id_in").val("")
    $(".orgs_select_search_wrapper #org_in_display").val("")
  )

  #递归获取所有子节点
  #参考http://stackoverflow.com/questions/2549320/looping-through-an-object-tree-recursively
  func_recursive_tree = (p_node,ref_return)->
    for c_node in p_node.nodes
      ref_return.push(c_node)
      func_recursive_tree(c_node,ref_return)


  on_select_org_eq = (evt,node)->
    console.log("当前选中节点:")
    console.log(node)
    #获取当前选中的org的所有下级
    all_nodes = [node]
    func_recursive_tree(node,all_nodes)

    console.log("所有节点:" )
    console.log(all_nodes)
    field_name = $(this).data("field_name")
    $("input[name='#{field_name}']").remove()
    for n in all_nodes
      el = $("<input type='hidden' name='#{field_name}' value='#{n.id}' />")
      $(".orgs_select_search_wrapper").append(el)

    $(".orgs_select_search_wrapper #org_in_display").val(node.text)
    $(".orgs_select_in_search_form").hide()

  $(document).on("nodeSelected",".orgs_select_in_search_form",on_select_org_eq)
