class World
  constructor: (@state) ->
    @width = @state[0].length

  count_neighbours: (cell) ->
    neighbouring_x = [cell.x - 1, cell.x, cell.x + 1]
      .filter (x) =>
        x >= 0 and x < @width
    neighbouring_y = [cell.y - 1, cell.y, cell.y + 1]
      .filter (y) =>
        y >= 0 and y < @width

    counter = 0
    maybe_increment = (row, column) =>
      if row == cell.x and column == cell.y
        return

      if @state[row][column] == 1
        counter +=1

    for x in neighbouring_x
      for y in neighbouring_y
        maybe_increment x, y
    counter

  was_cell_alive: (cell) ->
    @state[cell.x][cell.y] == 1


module.exports.World = World
