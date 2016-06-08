jQuery(function($) {
  var enter2tab = function(e) {
    if (e.keyCode == 13) {
      var target_el = e.target;
      /* FOCUS ELEMENT */
      var inputs = $(this).find('input:visible,select:visible,textarea:visible');
      var idx = inputs.index(target_el);

      if (idx == inputs.length - 1) {
        //自动跳到保存按钮上
        $('.btn_save:first').focus();
      } else {
        inputs[idx + 1].focus(); //  handles submit buttons
        var tag_name = $(inputs[idx + 1])[0].tagName.toLowerCase();
        if (tag_name == 'input' || tag_name == 'textarea') inputs[idx + 1].select();
      }
      return false;
    }
  };
  $('form.enter2tab').on('keydown', enter2tab);
});
