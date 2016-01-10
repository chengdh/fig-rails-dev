#比赛信息列表
@Immediate = React.createClass
  # Display name used for debugging
  displayName: 'Immediate',

  getInitialState: ->
    # The people JSON array used to display the cards in the view
    matches: []

  render: ->
    match_nodes = @state.matches.map (m)->
      <Match key={m.match_id} data={m} />

    <table className="table table-hover table-condensed table-striped" id="immediate_table" style={fontSize : "10px"}>
      <tbody>
        {match_nodes}
      </tbody>
    </table>

  componentDidMount: ->
    @_fetch_immedates()
    #setInterval(@_fetch_immedates, 10000);

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

  _fetch_data_fail: (xhr, status, err)->
    console.error "fetch data error"

#单条比赛信息显示
@Match = React.createClass
  displayName: "Match",
  render: ->
    <tr className="match-tr" data-match={JSON.stringify(@props.data)}>
      <td>
        <button className="btn btn-default btn-sm" type="button">
            <span className="glyphicon glyphicon-star" aria-hidden="true"></span>
        </button>
      </td>
      <td>
        <span>{@props.data.league.cn_name} {@props.data.match_time}</span>
        <p>
          {@props.data.current_match.home_yellow_card? and <span className="label label-warning">{@props.data.current_match.home_yellow_card}</span>}
          {@props.data.current_match.home_red_card? and <span className="label label-danger">{@props.data.current_match.home_red_card}</span>}
          {@props.data.team1.cn_name}
        </p>
      </td>
      <td>
        {@props.data.match_status_before_type_cast == 0 and "未开"}
        {@props.data.match_status_before_type_cast == 0 or @props.data.status}
        {@props.data.match_status_before_type_cast == 0 or <p><span className="label label-info">{@props.data.match_describe}</span></p>}
      </td>
      <td>
        {@props.data.begin}
        <p>
        {@props.data.team2.cn_name}
        {@props.data.current_match.guest_red_card? and <span className="label label-danger">{@props.data.current_match.guest_red_card}</span>}
        {@props.data.current_match.guest_yellow_card? and <span className="label label-warning">{@props.data.current_match.guest_yellow_card}</span>}
        </p>
      </td>
    </tr>

#即时指数界面
@ImmediateIndexTable = React.createClass
  displayName: "ImmediateIndexTable",
  getInitialState: ->
    # The people JSON array used to display the cards in the view
    matches: []

  render: ->
    match_nodes = @state.matches.map (m)->
      <ImmediateIndexItem key={m.match_id} data={match: m,companies: m.companies,begin_odds: m.odds_asians_begin,current_odds: m.odds_asians_current} />

    <table className="table table-hover table-condensed table-striped" id="immediate_index_table" style={fontSize : "10px"}>
      {match_nodes}
    </table>

  componentDidMount: ->
    @_fetch_immedate_index()
    #setInterval(@_fetch_immedate_index, 10000);

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
      <tr key={@props.data.match.match_id + "_head_1"}>
        <th colSpan="5">
          <h5>
            <span className="label label-primary">{@props.data.match.league.cn_name}</span>
            <span>&nbsp;{@props.data.match.match_time}&nbsp;</span>
            <span>{@props.data.match.team1.cn_name}</span>
            <span className="label label-danger">vs</span>
            <span>{@props.data.match.team2.cn_name}</span>
          </h5>
        </th>
      </tr>

    match_head_2 =
      <tr key={@props.data.match.match_id + "_head_2"}>
        <th style={textAlign : 'center'}>公司</th>
        <th style={textAlign : 'center'}></th>
        <th style={textAlign : 'center'}>主队</th>
        <th style={textAlign : 'center'}>盘口</th>
        <th style={textAlign : 'center'}>客队</th>
      </tr>

    ret.push(match_head_1)
    ret.push(match_head_2)

    for c in @props.data.companies
      ret.push(
        <tr key={@props.data.match.match_id + "_head_3"}>
          <td rowSpan="2" style={verticalAlign: 'middle'}>{c.cn_name}</td>
          <td>初盘</td>
          <td>{@props.data.begin_odds[i].home}</td>
          <td>{@props.data.begin_odds[i].goal}</td>
          <td>{@props.data.begin_odds[i].away}</td>
        </tr>
        <tr key={@props.data.match.match_id + "_head_4"}>
          <td>即时</td>
          <td>{@props.data.current_odds[i].home}</td>
          <td>{@props.data.current_odds[i].goal}</td>
          <td>{@props.data.current_odds[i].away}</td>
      </tr>
      )
      i++

    <tbody>{ret}</tbody>

#滚球数据table
@SbList = React.createClass
  displayName: "SbList",
  getInitialState: ->
    # The people JSON array used to display the cards in the view
    matches: []

  render: ->
    match_nodes = @state.matches.map (m)->
      <SbItem key={m.match_id} data={match: m,odds_asian: m.odds_asian,odds_ball: m.odds_balls,odds_europe: m.odds_europes} />

    <table className="table table-hover table-condensed table-striped" id="immediate_index_table" style={fontSize : "10px"}>
      <thead>
        <tr style={textAlign : 'center'}>
          <th></th>
          <th></th>
          <th>球队</th>
          <th>亚赔</th>
          <th>大小</th>
          <th>欧赔</th>
        </tr>
      </thead>
      {match_nodes}
    </table>

  componentDidMount: ->
    @_fetch_sb_list()
    #setInterval(@_fetch_sb_list, 10000);

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
        <td>{@props.data.match.team1.cn_name}</td>
        <td>{@props.data.match.odds_asian.home}</td>
        <td>{@props.data.match.odds_ball.over}</td>
        <td>{@props.data.match.odds_europe.hw}</td>
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
        <td>{@props.data.match.team2.cn_name}</td>
        <td>{@props.data.match.odds_asian.away}</td>
        <td>{@props.data.match.odds_ball.under}</td>
        <td>{@props.data.match.odds_europe.aw}</td>
      </tr>
    ret.push(tr_1)
    ret.push(tr_2)
    ret.push(tr_3)
    <tbody>{ret}</tbody>
