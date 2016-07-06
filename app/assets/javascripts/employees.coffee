# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #工作状况及职级发生变变化时,显示不同的工资项目
  $('#employee_form').on('change',->
    work_state = $('#employee_work_state').val()
    post_level = $("#employee_post_level").val()
    #领导
    if work_state == 'on_duty' and post_level == "1"
      $("table.wage-item-leader").show()
      $("table.wage-item-on-duty").hide()
      $("table.wage-item-retired").hide()

      $("table.wage-item-leader input").attr('disabled',false)
      $("table.wage-item-retired input").attr('disabled',true)
      $("table.wage-item-on-duty input").attr('disabled',true)

    if work_state == 'retired'
      $("table.wage-item-leader").hide()
      $("table.wage-item-on-duty").hide()
      $("table.wage-item-retired").show()
      $("table.wage-item-leader input").attr('disabled',true)
      $("table.wage-item-retired input").attr('disabled',false)
      $("table.wage-item-on-duty input").attr('disabled',true)



    if (work_state == 'on_duty' or work_state == 'non_staff') and post_level != "1" 
      $("table.wage-item-leader").hide()
      $("table.wage-item-on-duty").show()
      $("table.wage-item-retired").hide()
      $("table.wage-item-leader input").attr('disabled',true)
      $("table.wage-item-retired input").attr('disabled',true)
      $("table.wage-item-on-duty input").attr('disabled',false)
  )
