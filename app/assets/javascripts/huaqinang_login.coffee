# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  login = ->
    userName = $("#txtUserName").val()
    password = $("#txtPassword").val()
    $("#txtipaddrs").val('127.0.0.1');
    err_tip=$("#divErrorTip")

    if userName=="" or userName.length==0
      err_tip.html("您的用户名为空,请您重新输入！")
      err_tip.show()
      return
    if password == "" or password.length == 0
        err_tip.html("您的密码为空,请您重新输入！")
        err_tip.show()
        return

    err_tip.hide()

    $("#loginForm").submit()

  $('#Login_Btn').on('click',login)
