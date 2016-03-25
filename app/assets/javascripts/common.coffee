#一些共用的操作
$ ->
  #表单提交操作
  $(".btn-submit-form").on("click", ->
    form_id = $(this).data("form-id")
    $("##{form_id}").trigger("submit")
  )
  $(".fancybox").fancybox()

  #左侧菜单点击时,在cookie中记录当前点击的菜单
  $("[data-func-group-id]").on("click",->
    group_id = $(this).data("func-group-id")
    Cookies.set("nanyang-active-func-group-id",group_id)
  )
  $("[data-func-id]").on("click",->
    func_id = $(this).data("func-id")
    Cookies.set("nanyang-active-func-id",func_id)
  )
  #加载完毕后,展开菜单
  group_id = Cookies.get("nanyang-active-func-group-id")
  $(".treeview[data-func-group-id='#{group_id}']").addClass("active")
  func_id = Cookies.get("nanyang-active-func-id")
  $("li[data-func-id='#{func_id}']").addClass("active")
