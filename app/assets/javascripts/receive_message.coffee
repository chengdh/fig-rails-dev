$ ->
  $.receiveMessage( (evt) ->
    web_app = e.data.web_app
    sso = e.data.so
    el_username = $("input[name='" + web_app.form_el_username + "']")
    el_password = $("input[name='" + web_app.form_el_password + "']")
    el_login_btn = $("input[name='" + "ctl00$bodyContent$ctl00$ImageButton_Autho" + "']" )
    el_login_btn_2 = $("input[name='" + "submitButton" + "']" )

    $(el_username).val(sso.username)
    $(el_password).val(sso.password)
    if el_login_btn.length >= 1
      $(el_login_btn).trigger("click")
    if el_login_btn_2.length >= 1
      $(el_login_btn_2).trigger("click")
  )
