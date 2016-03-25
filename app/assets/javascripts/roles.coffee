# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".cbx-select-all-sys-opt").on("click", ->
    opt_wrapper = $(this).parents("thead").next()
    checked  = $(this).prop("checked")
    $(opt_wrapper).find(".cbx-sys-operate").prop('checked',checked)
  )
