# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #添加球队推荐
  func_recommend = (match,team_id,recommend_type) ->
    $.ajax(
        type: "POST",
        url: "/match_recommands.json",
        dataType: 'json',
        data:
          "match_recommand[match_id]": match.match_id,
          "match_recommand[team_id]": team_id,
          "match_recommand[recommend_type]": recommend_type
      )
      .done(-> toastr.success("推荐成功!"))
      .fail(-> toastr.error("推荐更新失败!"))


  func_unrecommend = (match,team_id,recommend_type) ->
    $.ajax(
        type: "DELETE",
        url: "/match_recommands/#{match.match_id},#{team_id},#{recommend_type}.json",
        dataType: 'json'
      )
      .done(-> toastr.success("取消推荐成功!"))
      .fail(-> toastr.error("取消推荐失败!"))



  $(".btn-home-bigdata-recommand,.btn-home-yinglang-recommand,.btn-guest-bigdata-recommand,.btn-guest-yinglang-recommand").on("click", ->
    recommend_type = $(this).data("recommend-type")
    recommend_home_or_guest =  $(this).data("recommend-home-or-guest")
    match = $(this).parents(".match-tr").data("match")
    team1_id = match.team1_id
    team2_id = match.team2_id

    #主队 大数据推荐
    if recommend_type == 1 and recommend_home_or_guest == 'home'
      if match["is_home_bigdata_recommend?"]
        func_unrecommend(match,team1_id,recommend_type)
        match["is_home_bigdata_recommend?"] = false
        $(this).find(".recommend-flag").css(color : "")
      else
        func_recommend(match,team1_id,recommend_type)
        match["is_home_bigdata_recommend?"] = true
        $(this).find(".recommend-flag").css(color : "red")

    #主队 赢朗推荐
    if recommend_type == 2 and recommend_home_or_guest == 'home'
      if match["is_home_yinglang_recommend?"]
        func_unrecommend(match,team1_id,recommend_type)
        match["is_home_yinglang_recommend?"] = false

        $(this).find(".recommend-flag").css(color : "")
      else
        func_recommend(match,team1_id,recommend_type)
        match["is_home_yinglang_recommend?"] = false

        $(this).find(".recommend-flag").css(color : "red")


    #客队 大数据推荐
    if recommend_type == 1 and recommend_home_or_guest == 'guest'
      if match["is_guest_bigdata_recommend?"]
        func_unrecommend(match,team2_id,recommend_type)
        match["is_guest_bigdata_recommend?"] = false

        $(this).find(".recommend-flag").css(color : "")
      else
        func_recommend(match,team2_id,recommend_type)
        match["is_guest_bigdata_recommend?"] = true

        $(this).find(".recommend-flag").css(color : "red")


    #客队 赢朗推荐
    if recommend_type == 2 and recommend_home_or_guest == 'guest'
      if match["is_guest_yinglang_recommend?"]
        func_unrecommend(match,team2_id,recommend_type)
        match["is_guest_yinglang_recommend?"] = false

        $(this).find(".recommend-flag").css(color : "")
      else
        func_recommend(match,team2_id,recommend_type)
        match["is_guest_yinglang_recommend?"] = false
        $(this).find(".recommend-flag").css(color : "true")

  )