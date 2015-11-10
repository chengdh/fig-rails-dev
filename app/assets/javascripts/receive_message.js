$(function() {
  var re = /([^&=]+)=?([^&]*)/g;
  var decodeRE = /\+/g;  // Regex for replacing addition symbol with a space
  var decode = function (str) {return decodeURIComponent( str.replace(decodeRE, " ") );};
  $.parseParams = function(query) {
    var params = {}, e;
    while ( e = re.exec(query) ) { 
      var k = decode( e[1] ), v = decode( e[2] );
        if (k.substring(k.length - 2) === '[]') {
          k = k.substring(0, k.length - 2);
          (params[k] || (params[k] = [])).push(v);
        }
        else params[k] = v;
    }
    return params;
  };
  $.receiveMessage( function(e){
    arg_obj = $.parseParams(e.data)
    el_form = $("form")
    el_form.attr("target","_blank")
    el_username = $("input[name='" + arg_obj["web_app[form_el_username]"] + "']");
    el_password = $("input[name='" + arg_obj["web_app[form_el_password]"] + "']");
    el_login_btn = $("input[name='" + "ctl00$bodyContent$ctl00$ImageButton_Autho" + "']" );
    el_login_btn_2 = $("input[name='" + "submitButton" + "']" );

    $(el_username).val(arg_obj["sso[username]"]);
    $(el_password).val(arg_obj["sso[password]"]);
    if(el_login_btn.length >= 1){
      $(el_login_btn).trigger("click");
    }
    if(el_login_btn_2.length >= 1) {
      $(el_login_btn_2).trigger("click");
    }
  });
});
