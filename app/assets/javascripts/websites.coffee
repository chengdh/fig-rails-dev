$ ->
  $("li[data-default-action='Website.zg_backend_login_url'] a").attr('href',"#")
  $("li[data-default-action='Website.anbao_backend_login_url'] a").attr('href',"#")
  func_zg_backend_login = ->
    $("#zg_login_form").remove()
    form = $("<form id='zg_login_form' action='http://10.67.192.116/admin/index.php/login/check' method='get' target='_blank' style='display: none;'>
    <input type='hidden' name='back' value='1'/>
    </form>
    ")
    $('body').append(form)
    $(form).submit()

  $("li[data-default-action='Website.zg_backend_login_url'] a").on('click',func_zg_backend_login)

  func_anbao_backend_login = ->
    $("#anbao_login_form").remove()
    form = $("<form id='anbao_login_form' action='http://10.67.192.116/html/website/admin.php?r=admin/Login/index' method='post' target='_blank' style='display: none;'>
    <input type='text' name='username' value='admin'/>
    <input type='password' name='password' value='admin' />
    </form>
    ")
    $('body').append(form)
    $(form).submit()

  $("li[data-default-action='Website.anbao_backend_login_url'] a").on('click',func_anbao_backend_login)
