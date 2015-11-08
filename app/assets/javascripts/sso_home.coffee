# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".btn-open-web-app").on("click", ->
    web_app = $(this).data("web-app")
    sso = $(this).data("sso")
    if web_app.direct_login_url and web_app.direct_login_url != ""
      $("#login-form").attr("action",web_app.direct_login_url)
      $("#login-form").submit()
      return false

    iframe = $("#iframe_web_app_" + web_app.id).contents()
    form = iframe.find("form")
    form.attr("target","_blank")
    el_username = form.find("input[name='" + web_app.form_el_username + "']")
    el_password = form.find("input[name='" + web_app.form_el_password + "']")
    $(el_username).val(sso.username)
    $(el_password).val(sso.password)
    $(form).submit()

    #$("#username").attr("name",web_app.form_el_username)
    #$("#password").attr("name",web_app.form_el_password)
    #$("#username").val(sso.username)
    #$("#password").val(sso.password)
    #$("#login-form").attr("action",web_app.form_action)
    #$("#login-form").attr("method",web_app.form_method)
    #$("#login-form").submit()
  )
