class StateVisualizer
  format: (state) ->
    rows = state.map @format_row
    rows.join("\n")

  format_row: (row) ->
    row
      .map (cell) ->
        if cell == 1 then 'O' else '-'
      .join(' ')

module.exports.StateVisualizer = StateVisualizer
