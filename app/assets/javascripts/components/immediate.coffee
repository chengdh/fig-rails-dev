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
    #setInterval(@_fetch_immedates, 10000);
    @_fetch_immedates()

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
