# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  chart_option = {
      mapLocation: {
        x: 'left',
        y: 'top',
        height: 700
      },
      tooltip: {
        trigger: 'item',
        formatter: (params, ticket, callback)->
          # args = fun_get_area_code(params.data.name)
          #
          # $.getJSON("/area_infos/get_mu_data.json",args).then((data)->
          #   $(".total_area").html(data.total_area)
          #   $(".finished_mus").html(data.finished_mu)
          #   $(".last_percent").html(data.last_percent)
          #   console.log(data)
          # )
          return ""
                    # var data = dataMap.get(params.data.id);
                    # var acArea = data[2] == null ? 0 : data[2];
                    # var totalArea = data[1] == null ? 0 : data[1];
                    # var scale = Percentage(acArea, totalArea);
                    # var res = "<div align='left'><h3>" + params.name + "机收信息统计：<h3/>";
                    # res += "<h5>总面积：" + totalArea + "</h5>" +
                    #         "<h5>机收面积：" + acArea + "</h5>" +
                    #         "<h5>机收比例：" + scale + "</h5>" +
                    #         "<h5>农机总数：" + data[3] + "</h5>" +
                    #         "<h5>调度次数：" + data[4] + "</h5>" +
                    #         "<h5 style='color: red'><双击鼠标左键调度发起></h5></div>";
                    # return res;
      },
      series:
        [
          {
            name: '城市',
            type: 'map',
            mapType: '410000',
            selectedMode: 'single',
            itemStyle: {
              normal: {
                label: {show: true}
              },
              emphasis: {label: {show: true}}
            },
            data: []
          }
        ]
    }

  chart = null
  func_chart_click = (params)->
    args = fun_get_area_code(params.data.name)

    $.getJSON("/area_infos/get_mu_data.json",args).then((data)->
      $(".total_area").html(data.total_area)
      $(".finished_mus").html(data.finished_mu)
      $(".last_percent").html(data.last_percent)
      console.log(data)
    )


  if $("#map_chart").length > 0
    chart = echarts.init(document.getElementById('map_chart'))
    chart.setOption(chart_option)
    chart.on('click',func_chart_click)


  
  $("#select_city").on('change', ->
    select_area_code = "410000"
    if $("#select_city").val() == ""
      select_area_code = $("#select_province").val()
    else
      select_area_code = $("#select_city").val()

    # chart_option.series[0].data = child_areas
    chart_option.series[0].mapType = select_area_code

    if $("#map_chart").length > 0
      chart = echarts.init(document.getElementById('map_chart'))
      chart.setOption(chart_option)
      chart.on('click',func_chart_click)
  )

  #根据名称获取选择区域的编码
  fun_get_area_code = (area_name)->
    province_code = $("#select_province").val()
    city_code = ""
    district_code = ""
    if $("#select_city").val() == ""
      for el_option in $("#select_city option")
        if $(el_option).text() == area_name
          city_code = $(el_option).val()
    else
      city_code = $("#select_city").val()
      for el_option in $("#select_district option")
        if $(el_option).text() == area_name
          district_code = $(el_option).val()

    ret =
      code_eq: province_code,
      city_code_eq: city_code,
      district_code_eq: district_code
    return ret

  # child_areas = []
  # $("#select_city").on('china_city:load_data_completed', ->
  #   child_areas = []
  #   for el in $("#select_city option")
  #     child_areas.push(
  #       name: $(el).text(),
  #       province_code: $("#select_province").val(),
  #       city_code: $(el).val()
  #     )
  # )
  # $("#select_district").on('china_city:load_data_completed', ->
  #   child_areas = []
  #   for el in $("#select_district option")
  #     child_areas.push(
  #       name: $(el).text(),
  #       province_code: $("#select_province").val(),
  #       city_code: $("#select_city").val(),
  #       district_code: $(el).val()
  #     )
  # )

  $("#select_province").val("410000").trigger("change")
