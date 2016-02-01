#盘口数据变化
@OddChangeTable = React.createClass
  displayName: "OddChangeTable",
  getInitialState: ->
    odd_changes: []

  render: ->
    change_nodes = @state.odd_changes.map (o)->
      <OddChangeItem key={"#{o.match.match_id}_#{o.timestamp}"} data={odd_change : o} />

    <table className="table table-hover table-condensed table-striped" id="odd_changes_table">
      <tbody>
        {change_nodes}
      </tbody>
    </table>

  componentDidMount: ->
    @_fetch_odd_changes()
    setInterval(@_fetch_odd_changes, 120*1000)

  _fetch_odd_changes: (data)->
    $.ajax(
      url: @props.url,
      dataType: 'json',
      data: data
      )
    .done @_fetch_data_done
    .fail @_fetch_data_fail

  _fetch_data_done: (data, textStatus, jqXHR)->
    console.log "fetch odd changes success"
    #判断是否有新的数据
    this_el = ReactDOM.findDOMNode(@)
    if (not @props.not_auto_hide?) and data.odd_changes.length > 0
      $(this_el).fadeIn().delay(10000).fadeOut()

    @setState
      odd_changes: data.odd_changes


#单条信息显示
@OddChangeItem = React.createClass
  displayName: "OddChangeItem",
  render: ->
    <tr onClick={@._open_odd_change}>
      <td>
        {@props.data.odd_change.change_type == 1 and
        <span style={color: "red"}>
          [{@props.data.odd_change.match_type_des}]
          {@props.data.odd_change.team?.cn_name}
          水位快速
        </span>}
        {@props.data.odd_change.change_type == 1 and <span className="glyphicon glyphicon-arrow-up" style={color : "red"}></span>}

        {@props.data.odd_change.change_type == 2 and
        <span style={color: "green"}>
          [{@props.data.odd_change.match_type_des}]
          {@props.data.odd_change.team?.cn_name}
          水位快速
        </span>}
        {@props.data.odd_change.change_type == 2 and <span className="glyphicon glyphicon-arrow-down" style={color : "green"}></span>}
      </td>
    </tr>

  #打开特征数据窗口
  _open_odd_change: ->
    Android.openOddChangeActivity()
