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
    var arg_obj = $.parseParams(e.data)
    var iframe = $("#iframe_xinxiang").contents();
    var el_form = $(iframe).find("form");
    el_form.attr("target","_blank");
    var el_username = $(iframe).find("input[name='" + arg_obj["web_app[form_el_username]"] + "']");
    var el_password = $(iframe).find("input[name='" + arg_obj["web_app[form_el_password]"] + "']");
    //新乡登录按钮
    var el_login_btn = $(iframe).find("#submitButton");

    $(el_username).val(arg_obj["sso[username]"]);
    $(el_password).val(arg_obj["sso[password]"]);
    if(el_login_btn.length >= 1) {
      $(el_login_btn).trigger("click");
      return;
    }
  });
});
