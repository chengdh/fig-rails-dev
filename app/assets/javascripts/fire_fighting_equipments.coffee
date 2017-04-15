# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#fire_fighting_equipment_out_factory_date,#fire_fighting_equipment_use_year").on("change", =>
    out_factory_date = moment($("#fire_fighting_equipment_out_factory_date").val())
    use_year = parseInt($("#fire_fighting_equipment_use_year").val())
    valid_date = out_factory_date.add(use_year,'y')
    $("#fire_fighting_equipment_valid_date").val(valid_date.format("YYYY-MM-DD"))
  )
