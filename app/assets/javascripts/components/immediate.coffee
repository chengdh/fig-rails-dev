#测试用
if not Android?
    window.Android = {}
    window.Android.getUserId = -> return 1
#刷新间隔
REFRESH_RATE = 120*1000
#比赛信息列表
@Immediate = React.createClass
  # Display name used for debugging
  displayName: 'Immediate',

  getInitialState: ->
    # The people JSON array used to display the cards in the view
    matches: JSON.parse(@props.matches).matches

  render: ->
    #将数据分组,已结束的比赛放到最后边
    matches = (m for m in @state.matches when not m.finished)
    finished_matches = (m for m in @state.matches when m.finished)

    match_nodes = matches.map (m)->
      <Match key={m.match_id} data={m} />

    finished_match_nodes = finished_matches.map (m)->
      <Match key={m.match_id} data={m} />


    <table className="table table-hover table-condensed table-striped" id="immediate_table" style={fontSize : "12px"}>
      <tbody>
        {match_nodes}
        {finished_match_nodes}
      </tbody>
    </table>

  componentDidMount: ->
    #@_fetch_immedates()
    self = this
    $("#table_immediate_list").pageless(
      totalPages: @props.total_pages,
      url: '/matches/immediate.json',
      loaderMsg: '稍侯...',
      loaderImage: "/assets/load.gif"
      scrape: (data)->
        new_matches = JSON.parse(data)?.matches
        self.setState((previousState, currentProps)->
          old_matches = previousState.matches
          return matches: old_matches.concat(new_matches)
        )
        return null

    )

    setInterval(@_fetch_immedates, REFRESH_RATE);

  _fetch_immedates: (data)->
    $.ajax(
      url: @props.url,
      dataType: 'json',
      data: data
      )
    .done @_fetch_data_done
    .fail @_fetch_data_fail

  _fetch_data_done: (data, textStatus, jqXHR)->
    console.log "fetch data success"
    @setState
      matches: data.matches

    @_fetch_favorites()

  #获取当前用户关注的比赛
  _fetch_favorites: ->
    user_id = Android.getUserId()
    $.ajax(
      url: "/my_favorites/#{user_id}.json",
      dataType: 'json'
    )
    .done((data)->
      #处理关注图标的显示颜色
      data.matches.map (m)->
        $(".match-#{m.match_id} .favorite-star").css(color : 'red').addClass('favorite')
    )
    .fail(->
      console.error "fetch favorite error"
    )


  _fetch_data_fail: (xhr, status, err)->
    console.error "fetch data error"


#单条比赛信息显示
@Match = React.createClass
  displayName: "Match",
  render: ->
    <tr className={"match-tr match-"+@props.data.match_id} data-match={JSON.stringify(@props.data)}>
      <td style={verticalAlign : "middle"}>
        <button className="btn btn-default btn-xs btn-favorite" type="button" onClick={@._on_favorite_click}>
            <span className="glyphicon glyphicon-star favorite-star" aria-hidden="true"></span>
        </button>
      </td>
      <td style={verticalAlign : "middle"}>
        {@props.data.is_home_bigdata_recommend and <span className="glyphicon glyphicon-tree-deciduous" ariaHidden="true" style={color : 'red'}></span>}
        {@props.data.is_home_yinglang_recommend and <span className="glyphicon glyphicon-thumbs-up" ariaHidden="true" style={color : 'red'}></span>}
      </td>
      <td style={verticalAlign : "middle",width : "45%"}>
        <span style={fontSize : '10px'}>{@props.data.league?.cn_name} {@props.data.match_time}</span>
        <p style={margin : 0,fontSize: "10px"}>
          {@props.data.current_match.home_yellow_card? and @props.data.current_match.home_yellow_card > 0 and <span  style={padding: "2px"} className="label label-warning">{@props.data.current_match.home_yellow_card}</span>}
          {@props.data.current_match.home_red_card? and @props.data.current_match.home_red_card > 0 and <span  style={padding: "2px"} className="label label-danger">{@props.data.current_match.home_red_card}</span>}
          {@props.data.team1.cn_name}
        </p>
      </td>
      <td style={verticalAlign : "middle",textAlign : "center"}>
        {@props.data.match_status_before_type_cast == 0 and "未开"}
        {@props.data.match_status_before_type_cast == 0 or @props.data.status}
        {@props.data.match_status_before_type_cast == 0 or <p style={margin : "0 0 2px 0"}><span className="label label-info">{@props.data.match_describe}</span></p>}
      </td>
      <td style={verticalAlign : "middle"}>
        {@props.data.is_guest_bigdata_recommend and <span className="glyphicon glyphicon-tree-deciduous" ariaHidden="true" style={color : 'red'}></span>}
        {@props.data.is_guest_yinglang_recommend and <span className="glyphicon glyphicon-thumbs-up" ariaHidden="true" style={color : 'red'}></span>}
      </td>
      <td style={verticalAlign : "middle",width : "45%"}>
        <span  style={fontSize : '10px'}>{@props.data.begin}</span>
        <p style={margin : 0,fontSize: "10px"}>
        {@props.data.team2.cn_name}
        {@props.data.current_match.guest_red_card? and @props.data.current_match.guest_red_card > 0 and <span style={padding: "2px"} className="label label-danger">{@props.data.current_match.guest_red_card}</span>}
        {@props.data.current_match.guest_yellow_card? and @props.data.current_match.guest_yellow_card > 0 and <span  style={padding: "2px"} className="label label-warning">{@props.data.current_match.guest_yellow_card}</span>}
        </p>
      </td>
      <td style={verticalAlign : "middle"}>
        <button className="btn btn-default btn-xs btn-bigdata" type="button" onClick={@._on_bigdata_click}>
            <span className="glyphicon glyphicon-cloud icon-bigdata" aria-hidden="true" style={color: "blue"}></span>
        </button>
      </td>
    </tr>

  _on_bigdata_click: ->
    match_id = @props.data.match_id
    Android.openMatchShowBigdataActivity(match_id)

  _on_favorite_click: ->
    btn_favorite = $(ReactDOM.findDOMNode(@)).find(".favorite-star")
    if btn_favorite.hasClass('favorite')
      @_unfavorite()
    else
      @_favorite()

  #取消关注处理
  _unfavorite: ->
    user_id = Android.getUserId()
    if user_id < 0
      toastr.warn("您当前未登录!")
      return
    else
      $.ajax(
        type: "DELETE",
        url: "/user_favorites/#{user_id},#{@props.data.match_id}.json",
        dataType: 'json',
        context: @
      )
      .done(->
        toastr.success("已取消关注!")
        el = $(ReactDOM.findDOMNode(@))
        el.find(".favorite-star").css(color : '').removeClass('favorite')
        if @props.in_favorite
          el.hide()
      )
      .fail(->toastr.error("取消关注失败!"))


  #关注处理
  _favorite: ->
    user_id = Android.getUserId()
    console.log("user_id : " + user_id)
    if user_id < 0
      toastr.warn("您当前未登录!")
      return
    else
      $.ajax(
        type: "POST",
        url: "/user_favorites.json",
        dataType: 'json',
        context: @,
        data:
          "user_favorite[user_id]" : user_id,
          "user_favorite[match_id]" : @props.data.match_id,
          "user_favorite[favor_type]" : 1
      )
      .done(->
        toastr.success("已成功关注比赛!")
        $(ReactDOM.findDOMNode(@)).find(".favorite-star").css(color : 'red').addClass('favorite')
      )
      .fail(->toastr.error("关注操作失败!"))

#比赛关注列表
@Favorite = React.createClass
  # Display name used for debugging
  displayName: 'Favorite',

  getInitialState: ->
    # The people JSON array used to display the cards in the view
    matches: JSON.parse(@props.matches)?.matches

  render: ->
    match_nodes = @state.matches.map (m)->
      <Match key={m.match_id} data={m} in_favorite={true} />

    <table className="table table-hover table-condensed table-striped" id="immediate_table">
      <tbody>
        {match_nodes}
      </tbody>
    </table>

  componentDidMount: ->
    #@_fetch_favorites()
    setInterval(@_fetch_favorites, REFRESH_RATE)

  _fetch_favorites: (data)->
    user_id = Android.getUserId()
    $.ajax(
      url: "/my_favorites/#{user_id}.json",
      dataType: 'json',
      data: data
      )
    .done @_fetch_data_done
    .fail @_fetch_data_fail

  _fetch_data_done: (data, textStatus, jqXHR)->
    console.log "fetch my favorites success"
    @setState
      matches: data.matches

    #处理关注图标的显示颜色
    data.matches.map (m)->
      $(".match-#{m.match_id} .favorite-star").css(color : 'red').addClass("favorite")

  _fetch_data_fail: (xhr, status, err)->
    console.error "fetch my favorites error"


#即时指数界面
@ImmediateIndexTable = React.createClass
  displayName: "ImmediateIndexTable",
  getInitialState: ->
    # The people JSON array used to display the cards in the view
    matches: JSON.parse(@props.matches)?.matches

  render: ->
    #将数据分组,已结束的比赛放到最后边
    matches = (m for m in @state.matches when not m.finished)
    finished_matches = (m for m in @state.matches when m.finished)

    match_nodes = matches.concat(finished_matches).map (m)->
      <ImmediateIndexItem key={m.match_id} data={
        match: m,
        companies: m.companies,
        odds_asians_begin: m.odds_asians_begin,
        odds_asians_current: m.odds_asians_current,
        odds_europes_begin: m.odds_europes_begin,
        odds_europes_current: m.odds_europes_current,
        odds_balls_begin: m.odds_balls_begin,
        odds_balls_current: m.odds_balls_current
      } />

    <table className="table table-hover table-condensed table-striped" id="immediate_index_table">
      {match_nodes}
    </table>

  componentDidMount: ->
    #@_fetch_immedate_index()
    self = this
    $("#table_immediate_index").pageless(
      totalPages: @props.total_pages,
      url: '/matches/immediate_index.json',
      loaderMsg: '稍侯...',
      loaderImage: "/assets/load.gif"
      scrape: (data)->
        new_matches = JSON.parse(data)?.matches
        self.setState((previousState, currentProps)->
          old_matches = previousState.matches
          return matches: old_matches.concat(new_matches)
        )
        return null

    )

    setInterval(@_fetch_immedate_index, 120*1000);

  _fetch_immedate_index: (data)->
    $.ajax(
      url: @props.url,
      dataType: 'json',
      data: data
      )
    .done @_fetch_data_done
    .fail @_fetch_data_fail

  _fetch_data_done: (data, textStatus, jqXHR)->
    console.log "fetch immediate_index.json success"
    @setState
      matches: data.matches

  _fetch_data_fail: (xhr, status, err)->
    console.error "fetch immediate_index.json error"


#即时指数单条记录
#传递过来的props参数：
#companies 博彩公司
#begin_odds 亚盘初盘数据
#current_odds 亚盘即时盘数据
@ImmediateIndexItem = React.createClass
  displayName: "ImmediateIndexItem",
  render: ->
    i = 0
    ret = []
    match_head_1 =
      <tr key={@props.data.match.match_id + "_head_1"} style={verticalAlign: 'middle'}>
        <th colSpan="10">
          <h5>
            <span className="label label-primary">{@props.data.match.league.cn_name}</span>
            <span>&nbsp;{@props.data.match.match_time}&nbsp;</span>
            {@props.data.match.is_home_bigdata_recommend and <span className="glyphicon glyphicon-tree-deciduous" ariaHidden="true" style={color : 'red'}></span>}
            {@props.data.match.is_home_yinglang_recommend and <span className="glyphicon glyphicon-thumbs-up" ariaHidden="true" style={color : 'red'}></span>}
            <span>{@props.data.match.team1.cn_name}</span>
            <span className="label label-danger">vs</span>
            <span>{@props.data.match.team2.cn_name}</span>
            {@props.data.match.is_guest_bigdata_recommend and <span className="glyphicon glyphicon-tree-deciduous" ariaHidden="true" style={color : 'red'}></span>}
            {@props.data.match.is_guest_yinglang_recommend and <span className="glyphicon glyphicon-thumbs-up" ariaHidden="true" style={color : 'red'}></span>}
          </h5>
        </th>
      </tr>

    match_head_2 =
      <tr key={@props.data.match.match_id + "_head_2"} style={fontSize: '10px',verticalAlign: 'middle'}>
        <th style={textAlign : 'center'}>公司</th>
        <th style={textAlign : 'center'}>主队</th>
        <th style={textAlign : 'center'}>让球</th>
        <th style={textAlign : 'center'}>客队</th>
        <th style={textAlign : 'center'}>主胜</th>
        <th style={textAlign : 'center'}>和局</th>
        <th style={textAlign : 'center'}>客胜</th>
        <th style={textAlign : 'center'}>大球</th>
        <th style={textAlign : 'center'}>盘口</th>
        <th style={textAlign : 'center'}>小球</th>
      </tr>

    ret.push(match_head_1)
    ret.push(match_head_2)

    for c in @props.data.companies
      ret.push(
        <tr key={@props.data.match.match_id + "_head_3"} style={fontSize: '10px'} data-company-id={c.company_id}>
          <td rowSpan="2" style={verticalAlign: 'middle'}>{c.cn_name}</td>
          <td>{@props.data.odds_asians_begin[i]?.home}</td>
          <td>{@props.data.odds_asians_begin[i]?.goal}</td>
          <td>{@props.data.odds_asians_begin[i]?.away}</td>
          <td>{@props.data.odds_europes_begin[i]?.hw}</td>
          <td>{@props.data.odds_europes_begin[i]?.st}</td>
          <td>{@props.data.odds_europes_begin[i]?.aw}</td>
          <td>{@props.data.odds_balls_begin[i]?.over}</td>
          <td>{@props.data.odds_balls_begin[i]?.goal}</td>
          <td>{@props.data.odds_balls_begin[i]?.under}</td>
        </tr>
        <tr key={@props.data.match.match_id + "_head_4"} style={fontSize: '10px'} data-company-id={c.company_id}>
          <td>{@props.data.odds_asians_current[i]?.home}</td>
          <td>{@props.data.odds_asians_current[i]?.goal}</td>
          <td>{@props.data.odds_asians_current[i]?.away}</td>
          <td>{@props.data.odds_europes_current[i]?.hw}</td>
          <td>{@props.data.odds_europes_current[i]?.st}</td>
          <td>{@props.data.odds_europes_current[i]?.aw}</td>
          <td>{@props.data.odds_balls_current[i]?.over}</td>
          <td>{@props.data.odds_balls_current[i]?.goal}</td>
          <td>{@props.data.odds_balls_current[i]?.under}</td>
      </tr>
      )
      i++

    <tbody>{ret}</tbody>

#滚球数据table
@SbList = React.createClass
  displayName: "SbList",
  getInitialState: ->
    # The people JSON array used to display the cards in the view
    matches: JSON.parse(@props.matches)?.matches

  render: ->
    match_nodes = @state.matches.map (m)->
      <SbItem key={m.match_id} data={
        match: m,
        odds_asian: m.odds_asian,
        odds_ball: m.odds_balls,
        odds_europe: m.odds_europes,
        is_home_bigdata_recommend: m.is_home_bigdata_recommend,
        is_home_yinglang_recommend: m.is_home_yinglang_recommend,
        is_guest_bigdata_recommend: m.is_guest_bigdata_recommend,
        is_guest_yinglang_recommed: m.is_guest_yinglang_recommend
      } />

    <table className="table table-hover table-condensed table-striped" id="immediate_index_table">
      <thead>
        <tr style={textAlign : 'center'}>
          <th></th>
          <th></th>
          <th>球队</th>
          <th>亚赔</th>
          <th>大小</th>
          <th>欧赔</th>
          <th></th>
        </tr>
      </thead>
      {match_nodes}
    </table>

  componentDidMount: ->
    self = this
    #@_fetch_sb_list()
    $("#table_sb_list").pageless(
      totalPages: @props.total_pages,
      url: '/matches/sb_list.json',
      loaderMsg: '稍侯...',
      loaderImage: "/assets/load.gif"
      scrape: (data)->
        new_matches = JSON.parse(data)?.matches
        self.setState((previousState, currentProps)->
          old_matches = previousState.matches
          return matches: old_matches.concat(new_matches)
        )
        return null

    )

    setInterval(@_fetch_sb_list, REFRESH_RATE);

  _fetch_sb_list: (data)->
    $.ajax(
      url: @props.url,
      dataType: 'json',
      data: data
      )
    .done @_fetch_data_done
    .fail @_fetch_data_fail

  _fetch_data_done: (data, textStatus, jqXHR)->
    console.log "fetch sb_list.json success"
    @setState
      matches: data.matches

  _fetch_data_fail: (xhr, status, err)->
    console.error "fetch sb_list.json error"


#滚球数据item
@SbItem = React.createClass
  displayName: "SbItem",
  render: ->
    ret = []
    tr_1 =
      <tr key={@props.data.match.match_id+"_tr_1"} style={textAlign : 'center'}>
        <td>{@props.data.match.league.cn_name}</td>
        <td>{@props.data.match.current_match.home_score}</td>
        <td style={verticalAlign : "middle"}>
          {@props.data.is_home_bigdata_recommend and <span className="glyphicon glyphicon-tree-deciduous" ariaHidden="true" style={color : 'red'}></span>}
          {@props.data.is_home_yinglang_recommend and <span className="glyphicon glyphicon-up" ariaHidden="true" style={color : 'red'}></span>}
          {@props.data.match.team1.cn_name}
        </td>
        <td>{@props.data.match.odds_asian.home}</td>
        <td>{@props.data.match.odds_ball.over}</td>
        <td>{@props.data.match.odds_europe.hw}</td>
        <td rowSpan="3" style={verticalAlign : "middle"}>
          <button className="btn btn-default btn-xs btn-bigdata" type="button" onClick={@._on_bigdata_click}>
            <span className="glyphicon glyphicon-cloud icon-bigdata" aria-hidden="true" style={color: "blue"}></span>
          </button>
        </td>

      </tr>
    tr_2 =
      <tr  key={@props.data.match.match_id+"_tr_2"} style={textAlign : 'center'}>
        <td>{@props.data.match.match_time}</td>
        <td>{@props.data.match.status}</td>
        <td></td>
        <td>{@props.data.match.odds_asian.goal}</td>
        <td>{@props.data.match.odds_ball.goal}</td>
        <td>{@props.data.match.odds_europe.st}</td>
      </tr>
    tr_3 =
      <tr  key={@props.data.match.match_id+"_tr_3"} style={textAlign : 'center'}>
        <td></td>
        <td>{@props.data.match.current_match.guest_score}</td>
        <td style={verticalAlign : "middle"}>
          {@props.data.is_guest_bigdata_recommend and <span className="glyphicon glyphicon-tree-deciduous" ariaHidden="true" style={color : 'red'}></span>}
          {@props.data.is_guest_yinglang_recommend and <span className="glyphicon glyphicon-up" ariaHidden="true" style={color : 'red'}></span>}
          {@props.data.match.team2.cn_name}
        </td>
        <td>{@props.data.match.odds_asian.away}</td>
        <td>{@props.data.match.odds_ball.under}</td>
        <td>{@props.data.match.odds_europe.aw}</td>
      </tr>
    ret.push(tr_1)
    ret.push(tr_2)
    ret.push(tr_3)
    <tbody>{ret}</tbody>

  _on_bigdata_click: ->
    match_id = @props.data.match.match_id
    Android.openMatchShowBigdataActivity(match_id)


