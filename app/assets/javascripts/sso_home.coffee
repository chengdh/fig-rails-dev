# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".btn-open-web-app").on("click", ->
    web_app = $(this).data("web-app")
    sso = $(this).data("sso")
    $("#username").attr("name",web_app.form_el_username)
    $("#password").attr("name",web_app.form_el_password)
    $("#username").val(sso.username)
    $("#password").val(sso.password)
    $("#login-form").attr("action",web_app.form_action)
    $("#login-form").attr("method",web_app.form_method)
    $("#login-form").submit()
  )
