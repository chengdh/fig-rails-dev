# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  ability_org_ids = $("#global_orgs").data("ability_org_ids")
  $(".user_org_wrapper").hide()
  for org_id in ability_org_ids
    $(".user_org_wrapper[data-org_id='#{org_id}']").show()

### 以下代码暂不使用
  org_nodes = $("#global_orgs").data("orgs")
  user_orgs = $("#user_org_tree").data("user_orgs")

  $('#user_org_tree').livequery(->
    selected_org_ids = []
    if user_orgs != null and user_orgs.length > 0
      selected_org_ids.push(uo.org_id) for uo in user_orgs
      for o in org_nodes
        for so_id in selected_org_ids
          if o.id == so_id
            o.state = {checked: true}

    $(this).treeview({data: [org_nodes],showCheckbox: true})
  )

  #递归获取所有子节点
  #参考http://stackoverflow.com/questions/2549320/looping-through-an-object-tree-recursively
  func_recursive_tree = (p_node,ref_return)->
    for c_node in p_node.nodes
      ref_return.push(c_node)
      func_recursive_tree(c_node,ref_return)

  func_get_parents = (c_node,ref_return)->
    p_node = $('#user_org_tree').treeview(true).getParent(c_node)
    if p_node
      ref_return.push(p_node)
      func_get_parents(p_node,ref_return)

  func_node_checked = (evt,node)->
    c_nodes = []
    func_recursive_tree(node,c_nodes)
    $("#user_org_tree").treeview(true).checkNode(c.nodeId,{silent: true}) for c in c_nodes
    func_create_user_orgs_form()

  $("#user_org_tree").on("nodeChecked",func_node_checked)


  func_node_unchecked = (evt,node)->
    c_nodes = []
    p_nodes = []
    func_get_parents(node,p_nodes)
    func_recursive_tree(node,c_nodes)
    $("#user_org_tree").treeview(true).uncheckNode(c.nodeId,{silent: true}) for c in c_nodes
    $("#user_org_tree").treeview(true).uncheckNode(p.nodeId,{silent: true}) for p in p_nodes
    func_create_user_orgs_form()


  $("#user_org_tree").on("nodeUnchecked",func_node_unchecked)

  func_create_user_orgs_form = ->
    $(".user_org_id").remove()
    $(".user_org_id_is_select").remove()
    i = 0
    node_ids = []
    all_nodes = $("#user_org_tree [data-nodeid]")
    node_ids.push($(el).data("nodeid")) for el in all_nodes
    for n_id in node_ids
      n = $("#user_org_tree").treeview(true).getNode(n_id)
      el_org_id = $("<input type='hidden' class='user_org_id' name='user[user_orgs_attributes][#{i}][org_id]' value='#{n.id}' />")
      el_org_id_is_select = $("<input type='hidden' class='user_org_is_select' name='user[user_orgs_attributes][#{i}][is_select]' value='#{n.state.checked}' />")
      $("#user_form").append(el_org_id)
      $("#user_form").append(el_org_id_is_select)
      i++
###
